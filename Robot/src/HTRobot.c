/*         		    					     HTRobot.c
**	W3C MINI ROBOT
**
**	(c) COPRIGHT MIT 1995.
**	Please first read the full copyright statement in the file COPYRIGH.
**
**	This program illustrates how to travers links using the Anchor object
**
**  Authors:
**	HFN		Henrik Frystyk Nielsen, (frystyk@w3.org)
**
**  History:
**	Dec 04 95	First version
*/

#include "WWWLib.h"			      /* Global Library Include file */
#include "WWWApp.h"				        /* Application stuff */
#include "WWWRules.h"
#include "WWWApp.h"
#include "WWWTrans.h"
#include "WWWInit.h"

#include "HText.h"

#include "HTRobot.h"			     		 /* Implemented here */

#ifndef W3C_VERSION
#define W3C_VERSION 		"unspecified"
#endif

#define APP_NAME		"W3CRobot"
#define APP_VERSION		W3C_VERSION

#define DEFAULT_OUTPUT_FILE	"robot.out"
#define DEFAULT_RULE_FILE	"robot.conf"
#define DEFAULT_LOG_FILE       	"robot.log"
#define DEFAULT_DEPTH		0

#define SHOW_MSG		(WWWTRACE || HTAlert_interactive())

#define DEFAULT_TIMEOUT		10		       /* timeout in seconds */

#if defined(__svr4__)
#define CATCH_SIG
#endif

typedef enum _MRFlags {
    MR_IMG	= 0x1,
    MR_LINK	= 0x2,
    MR_PREEMPTIVE= 0x4,
    MR_TIME	= 0x8
} MRFlags;

typedef struct _Robot {
    HTRequest *		request;
    HTRequest *		timeout;	  /* Until we get a server eventloop */
    HTParentAnchor *	anchor;
    int			depth;			     /* How deep is our tree */
    HTList *		hyperdoc;	     /* List of our HyperDoc Objects */
    HTList *		htext;			/* List of our HText Objects */
    struct timeval *	tv;				/* Timeout on socket */
    char *		cwd;				  /* Current dir URL */
    char *		rules;
    char *		logfile;
    char *		outputfile;
    FILE *	        output;
    MRFlags		flags;
} Robot;
	
typedef enum _LoadState {
    L_INVALID	= -2,
    L_LOADING	= -1,
    L_SUCCESS 	= 0,
    L_ERROR
} LoadState;

/*
**  The HyperDoc object is bound to the anchor and contains information about
**  where we are in the search for recursive searches
*/
typedef struct _HyperDoc {
    HTParentAnchor * 	anchor;
    LoadState		state;
    int			depth;
} HyperDoc;

/*
** This is the HText object that is created every time we start parsing a 
** HTML object
*/
struct _HText {
    HTRequest *		request;
};

PUBLIC HText * HTMainText = NULL;
PUBLIC HTParentAnchor * HTMainAnchor = NULL;
PUBLIC HTStyleSheet * styleSheet = NULL;

/* ------------------------------------------------------------------------- */

/*	Standard (non-error) Output
**	---------------------------
*/
PUBLIC int OutputData(const char  * fmt, ...)
{
    int ret;
    va_list pArgs;
    va_start(pArgs, fmt);
    ret = vfprintf(stdout, fmt, pArgs);
    va_end(pArgs);
    return ret;
}

/* ------------------------------------------------------------------------- */

/*	Create a "HyperDoc" object
**	--------------------------
**	A HyperDoc object contains information about whether we have already
**	started checking the anchor and the depth in our search
*/
PRIVATE HyperDoc * HyperDoc_new (Robot * mr,HTParentAnchor * anchor, int depth)
{
    HyperDoc * hd;
    if ((hd = (HyperDoc *) HT_CALLOC(1, sizeof(HyperDoc))) == NULL)
	HT_OUTOFMEM("HyperDoc_new");
    hd->state = L_INVALID;
    hd->depth = depth;
 
    /* Bind the HyperDoc object together with the Anchor Object */
    hd->anchor = anchor;
    HTAnchor_setDocument(anchor, (void *) hd);

    /* Add this HyperDoc object to our list */
    if (!mr->hyperdoc) mr->hyperdoc = HTList_new();
    HTList_addObject(mr->hyperdoc, (void *) hd);
    return hd;
}

/*	Delete a "HyperDoc" object
**	--------------------------
*/
PRIVATE BOOL HyperDoc_delete (HyperDoc * hd)
{
    if (hd) {
	HT_FREE (hd);
	return YES;
    }
    return NO;
}

/*	Create a Command Line Object
**	----------------------------
*/
PRIVATE Robot * Robot_new (void)
{
    Robot * me;
    if ((me = (Robot *) HT_CALLOC(1, sizeof(Robot))) == NULL ||
	(me->tv = (struct timeval*) HT_CALLOC(1, sizeof(struct timeval))) == NULL)
	HT_OUTOFMEM("Robot_new");
    me->hyperdoc = HTList_new();
    me->htext = HTList_new();
    me->tv->tv_sec = DEFAULT_TIMEOUT;
    me->cwd = HTGetCurrentDirectoryURL();
    me->output = OUTPUT;

    /* We keep an extra timeout request object for the timeout_handler */
    me->timeout = HTRequest_new();
    HTRequest_setContext (me->timeout, me);

    /* Bind the Robot object together with the Request Object */
    me->request = HTRequest_new();
    HTRequest_setContext (me->request, me);
    return me;
}

/*	Delete a Command Line Object
**	----------------------------
*/
PRIVATE BOOL Robot_delete (Robot * me)
{
    if (me) {
	if (me->hyperdoc) {
	    HTList * cur = me->hyperdoc;
	    HyperDoc * pres;
	    while ((pres = (HyperDoc *) HTList_nextObject(cur)))
		HyperDoc_delete(pres);
	    HTList_delete(me->hyperdoc);
	}
	if (me->htext) {
	    HTList * cur = me->htext;
	    HText * pres;
	    while ((pres = (HText *) HTList_nextObject(cur)))
		HText_free(pres);
	    HTList_delete(me->htext);
	}
	if (me->logfile) HTLog_close();
	if (me->output && me->output != STDOUT) fclose(me->output);
	if (me->flags & MR_TIME) {
	    time_t local = time(NULL);
	    HTTrace("Robot terminated %s\n",HTDateTimeStr(&local,YES));
	}
	HT_FREE(me->cwd);
	HT_FREE(me->tv);
	HT_FREE(me);
	return YES;
    }
    return NO;
}

/*
**  This function creates a new request object and initializes it
*/
PRIVATE HTRequest * Thread_new (Robot * mr, HTMethod method)
{
    HTRequest * newreq = HTRequest_new();
    HTRequest_setContext (newreq, mr);
    if (mr->flags & MR_PREEMPTIVE) HTRequest_setPreemptive(newreq, YES);
    HTRequest_addRqHd(newreq, HT_C_HOST);
    HTRequest_setMethod(newreq, method);
    return newreq;
}

PRIVATE BOOL Thread_delete (Robot * mr, HTRequest * request)
{
    if (mr && request) {
	HTRequest_delete(request);
	return YES;
    }
    return NO;
}

/*
**  Cleanup and make sure we close all connections including the persistent
**  ones
*/
PRIVATE void Cleanup (Robot * me, int status)
{
    HTNet_killAll();
    Robot_delete(me);
    HTLibTerminate();
#ifdef VMS
    exit(status ? status : 1);
#else
    exit(status ? status : 0);
#endif
}

#ifdef CATCH_SIG
#include <signal.h>
/*								    SetSignal
**  This function sets up signal handlers. This might not be necessary to
**  call if the application has its own handlers (lossage on SVR4)
*/
PRIVATE void SetSignal (void)
{
    /* On some systems (SYSV) it is necessary to catch the SIGPIPE signal
    ** when attemting to connect to a remote host where you normally should
    ** get `connection refused' back
    */
    if (signal(SIGPIPE, SIG_IGN) == SIG_ERR) {
	if (PROT_TRACE) HTTrace("HTSignal.... Can't catch SIGPIPE\n");
    } else {
	if (PROT_TRACE) HTTrace("HTSignal.... Ignoring SIGPIPE\n");
    }
}
#endif /* CATCH_SIG */

PRIVATE void VersionInfo (void)
{
    OutputData("\n\nW3C Reference Software\n\n");
    OutputData("\tW3C Mini Robot (%s) version %s.\n",
	     APP_NAME, APP_VERSION);
    OutputData("\tW3C Reference Library version %s.\n\n",HTLib_version());
    OutputData("Please send feedback to <libwww@w3.org>\n");
}

/*	terminate_handler
**	-----------------
**	This function is registered to handle the result of the request.
**	If no more requests are pending then terminate program
*/
PRIVATE int terminate_handler (HTRequest * request, void * param, int status) 
{
    Robot * mr = (Robot *) HTRequest_context(request);
    if (mr->logfile) HTLog_add(request, status);
    Thread_delete(mr, request);
    if (HTNet_isEmpty()) Cleanup(mr, 0);
    return HT_OK;
}

/*	timeout_handler
**	---------------
**	This function is registered to handle timeout in select eventloop
**
**	BUG: This doesn't work as we don't get the right request object
**	back from the event loop
*/
PRIVATE int timeout_handler (HTRequest * request)
{
#if 0
    Robot * mr = (Robot *) HTRequest_context(request);
#endif
    if (SHOW_MSG) HTTrace("Robot....... We don't know how to handle timeout...\n");
#if 0
    HTRequest_kill(request);
    Thread_delete(mr, request);
#endif
    return HT_OK;
}

/* ------------------------------------------------------------------------- */
/*				HTEXT INTERFACE				     */
/* ------------------------------------------------------------------------- */

PUBLIC HText * HText_new2 (HTRequest * request, HTParentAnchor * anchor,
			   HTStream * stream)
{
    HText * me;
    Robot * mr = (Robot *) HTRequest_context(request);
    if ((me = (HText *) HT_CALLOC(1, sizeof(HText))) == NULL)
	HT_OUTOFMEM("HText_new2");

    /* Bind the HText object together with the Request Object */
    me->request = request;

    /* Add this HyperDoc object to our list */
    if (!mr->htext) mr->htext = HTList_new();
    HTList_addObject(mr->htext, (void *) me);
    return me;
}

PUBLIC void HText_free (HText * me) {
    if (me) HT_FREE (me);
}

PUBLIC void HText_beginAnchor (HText * text, HTChildAnchor * anchor)
{
    if (text && anchor) {
	Robot * mr = (Robot *) HTRequest_context(text->request);
	HTAnchor * dest = HTAnchor_followMainLink((HTAnchor *) anchor);
	HTParentAnchor * dest_parent = HTAnchor_parent(dest);
	char * uri = HTAnchor_address((HTAnchor *) dest_parent);
	HyperDoc * hd = HTAnchor_document(dest_parent);

	if (SHOW_MSG) HTTrace("Robot....... Found `%s\' - ", uri ? uri : "NULL");
	
	/* Test whether we already have a hyperdoc for this document */
	if (mr->flags & MR_LINK && dest_parent && !hd) {
	    HTParentAnchor * parent = HTRequest_parent(text->request);
	    HyperDoc * last = HTAnchor_document(parent);
	    int depth = last ? last->depth+1 : 0;
	    HTRequest * newreq = Thread_new(mr, METHOD_GET);
	    HyperDoc_new(mr, dest_parent, depth);
	    HTRequest_setParent(newreq, HTRequest_anchor(text->request));
	    if (depth >= mr->depth) {
		if (SHOW_MSG)
		    HTTrace("loading at depth %d using HEAD\n", depth);
		HTRequest_setMethod(newreq, METHOD_HEAD);
		HTRequest_setOutputFormat(newreq, WWW_MIME);
	    } else {
		if (SHOW_MSG) HTTrace("loading at depth %d\n", depth);
	    }
	    if (HTLoadAnchor((HTAnchor *) dest_parent, newreq) != YES) {
		if (SHOW_MSG) HTTrace("not tested!\n");
		Thread_delete(mr, newreq);
	    }
	} else {
	    if (SHOW_MSG) HTTrace("duplicate or max depth reached\n");
	}
	HT_FREE(uri);
    }
}

PUBLIC void HText_appendImage (HText * text, HTChildAnchor * anchor,
			       const char *alt, const char * align, BOOL isMap)
{
    if (text && anchor) {
	Robot * mr = (Robot *) HTRequest_context(text->request);
	HTParentAnchor * dest = (HTParentAnchor *)
	    HTAnchor_followMainLink((HTAnchor *) anchor);
	HyperDoc * hd = HTAnchor_document(dest);

	/* Test whether we already have a hyperdoc for this document */
	if (mr->flags & MR_IMG && dest && !hd) {
	    HTParentAnchor * parent = HTRequest_parent(text->request);
	    HyperDoc * last = HTAnchor_document(parent);
	    int depth = last ? last->depth+1 : 0;
	    HTRequest * newreq = Thread_new(mr, METHOD_HEAD);
	    HyperDoc_new(mr, dest, depth);
	    if (SHOW_MSG) {
		char * uri = HTAnchor_address((HTAnchor *) dest);
		HTTrace("Robot....... Checking Image `%s\'\n", uri);
		HT_FREE(uri);
	    }
	    if (HTLoadAnchor((HTAnchor *) dest, newreq) != YES) {
		if (SHOW_MSG)
		    HTTrace("Robot....... Image not tested!\n");
		Thread_delete(mr, newreq);
	    }
	}
    }
}

PUBLIC void HText_endAnchor (HText * text) {}
PUBLIC void HText_appendText (HText * text, const char * str) {}
PUBLIC void HText_appendCharacter (HText * text, char ch) {}
PUBLIC void HText_endAppend (HText * text) {}
PUBLIC void HText_setStyle (HText * text, HTStyle * style) {}
PUBLIC void HText_beginAppend (HText * text) {}
PUBLIC void HText_appendParagraph (HText * text) {}

/* ------------------------------------------------------------------------- */
/*				  MAIN PROGRAM				     */
/* ------------------------------------------------------------------------- */

int main (int argc, char ** argv)
{
    int		status = 0;	
    int		arg;
    HTChunk *	keywords = NULL;			/* From command line */
    int		keycnt = 0;
    Robot *	mr = NULL;

    /* Starts Mac GUSI socket library */
#ifdef GUSI
    GUSISetup(GUSIwithSIOUXSockets);
    GUSISetup(GUSIwithInternetSockets);
#endif

#ifdef __MWERKS__ /* STR */
    InitGraf((Ptr) &qd.thePort); 
    InitFonts(); 
    InitWindows(); 
    InitMenus(); TEInit(); 
    InitDialogs(nil); 
    InitCursor();
    SIOUXSettings.asktosaveonclose = false;
    argc=ccommand(&argv);
#endif

    /* Initiate W3C Reference Library with a robot profile */
    HTProfile_newRobot(APP_NAME, APP_VERSION);

    /* Add the default HTML parser to the set of converters */
    {
	HTList * converters = HTFormat_conversion();
	HTMLInit(converters);
    }

    /* Build a new robot object */
    mr = Robot_new();

    /* Scan command Line for parameters */
    for (arg=1; arg<argc; arg++) {
	if (*argv[arg] == '-') {
	    
	    /* non-interactive */
	    if (!strcmp(argv[arg], "-n")) {
		HTAlert_setInteractive(NO);

	    /* log file */
	    } else if (!strcmp(argv[arg], "-l")) {
		mr->logfile = (arg+1 < argc && *argv[arg+1] != '-') ?
		    argv[++arg] : DEFAULT_LOG_FILE;

	    /* rule file */
	    } else if (!strcmp(argv[arg], "-r")) {
		mr->rules = (arg+1 < argc && *argv[arg+1] != '-') ?
		    argv[++arg] : DEFAULT_RULE_FILE;

	    /* output filename */
	    } else if (!strcmp(argv[arg], "-o")) { 
		mr->outputfile = (arg+1 < argc && *argv[arg+1] != '-') ?
		    argv[++arg] : DEFAULT_OUTPUT_FILE;

	    /* timeout -- Change the default request timeout */
	    } else if (!strcmp(argv[arg], "-timeout")) {
		int timeout = (arg+1 < argc && *argv[arg+1] != '-') ?
		    atoi(argv[++arg]) : DEFAULT_TIMEOUT;
		if (timeout > 0) mr->tv->tv_sec = timeout;

	    /* preemptive or non-preemptive access */
	    } else if (!strcmp(argv[arg], "-single")) {
		HTRequest_setPreemptive(mr->request, YES);
		mr->flags |= MR_PREEMPTIVE;

	    /* test inlined images */
	    } else if (!strcmp(argv[arg], "-img")) {
		mr->flags |= MR_IMG;

	    /* load anchors */
	    } else if (!strcmp(argv[arg], "-link")) {
		mr->flags |= MR_LINK;
		mr->depth = (arg+1 < argc && *argv[arg+1] != '-') ?
		    atoi(argv[++arg]) : DEFAULT_DEPTH;

	    /* preemptive or non-preemptive access */
	    } else if (!strcmp(argv[arg], "-single")) {
		HTRequest_setPreemptive(mr->request, YES);
		mr->flags |= MR_PREEMPTIVE;

	    /* Output start and end time */
	    } else if (!strcmp(argv[arg], "-ss")) {
		time_t local = time(NULL);
		HTTrace("Robot started on %s\n",
			 HTDateTimeStr(&local, YES));
		mr->flags |= MR_TIME;

	    /* print version and exit */
	    } else if (!strcmp(argv[arg], "-version")) { 
		VersionInfo();
		Cleanup(mr, 0);

#ifdef WWWTRACE
	    /* trace flags */
	    } else if (!strncmp(argv[arg], "-v", 2)) {
		HTSetTraceMessageMask(argv[arg]+2);
#endif

	    } else {
		if (SHOW_MSG) HTTrace("Bad Argument (%s)\n", argv[arg]);
	    }
       } else {	 /* If no leading `-' then check for URL or keywords */
    	    if (!keycnt) {
		char * ref = HTParse(argv[arg], mr->cwd, PARSE_ALL);
		mr->anchor = (HTParentAnchor *) HTAnchor_findAddress(ref);
		HyperDoc_new(mr, mr->anchor, 0);
		keycnt = 1;
		HT_FREE(ref);
	    } else {		   /* Check for successive keyword arguments */
		char *escaped = HTEscape(argv[arg], URL_XALPHAS);
		if (keycnt++ <= 1)
		    keywords = HTChunk_new(128);
		else
		    HTChunk_putc(keywords, ' ');
		HTChunk_puts(keywords, HTStrip(escaped));
		HT_FREE(escaped);
	    }
	}
    }

#ifdef CATCH_SIG
    SetSignal();
#endif

    if (!keycnt) {
	if (SHOW_MSG) HTTrace("Please specify URL to check.\n");
	Cleanup(mr, -1);
    }

    /* Testing that HTTrace is working */
    HTTrace ("Welcome to the W3C mini Robot\n");

    /* Rule file specified? */
    if (mr->rules) {
	char * rules = HTParse(mr->rules, mr->cwd, PARSE_ALL);
	if (!HTLoadRules(rules))
	    if (SHOW_MSG) HTTrace("Can't access rules\n");
	HT_FREE(rules);
    }

    /* Output file specified? */
    if (mr->outputfile) {
	if ((mr->output = fopen(mr->outputfile, "wb")) == NULL) {
	    if (SHOW_MSG) HTTrace("Can't open `%s'\n", mr->outputfile);
	    mr->output = OUTPUT;
	}
    }

    /* Log file specifed? */
    if (mr->logfile) HTLog_open(mr->logfile, YES, YES);

    /* Register our own someterminater filter */
    HTNetCall_addAfter(terminate_handler, NULL, HT_ALL);
    
    /* Set timeout on sockets */
    HTEventrg_registerTimeout(mr->tv, mr->timeout, timeout_handler, NO);

    /* Start the request */
    if (keywords)						   /* Search */
	status = HTSearchAnchor(keywords, (HTAnchor *)mr->anchor, mr->request);
    else
	status = HTLoadAnchor((HTAnchor *) mr->anchor, mr->request);

    if (keywords) HTChunk_delete(keywords);
    if (status != YES) {
	if (SHOW_MSG) HTTrace("Can't access resource\n");
	Cleanup(mr, -1);
    }

    /* Go into the event loop... */
    HTEventrg_loop(mr->request);

    /* Only gets here if event loop fails */
    Cleanup(mr, 0);
    return 0;
}
