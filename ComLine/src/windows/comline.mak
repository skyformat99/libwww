# Microsoft Developer Studio Generated NMAKE File, Format Version 4.20
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=comline - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to comline - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "comline - Win32 Release" && "$(CFG)" !=\
 "comline - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "comline.mak" CFG="comline - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "comline - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "comline - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 
################################################################################
# Begin Project
# PROP Target_Last_Scanned "comline - Win32 Debug"
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "comline - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
OUTDIR=.\Release
INTDIR=.\Release

ALL : "..\..\..\Bin\Release\comline.exe"

CLEAN : 
	-@erase "$(INTDIR)\HTBInit.obj"
	-@erase "$(INTDIR)\HTInit.obj"
	-@erase "$(INTDIR)\HTLine.obj"
	-@erase "$(INTDIR)\HTMLPDTD.obj"
	-@erase "$(INTDIR)\HTProfil.obj"
	-@erase "..\..\..\Bin\Release\comline.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "..\..\..\Library\src" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "WWW_WIN_DLL" /YX /c
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "..\..\..\Library\src" /D "NDEBUG" /D\
 "WIN32" /D "_CONSOLE" /D "WWW_WIN_DLL" /Fp"$(INTDIR)/comline.pch" /YX\
 /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=.\.
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/comline.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 /nologo /subsystem:console /machine:I386 /out:"..\..\..\Bin\Release\comline.exe"
LINK32_FLAGS=/nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/comline.pdb" /machine:I386\
 /out:"..\..\..\Bin\Release\comline.exe" 
LINK32_OBJS= \
	"$(INTDIR)\HTBInit.obj" \
	"$(INTDIR)\HTInit.obj" \
	"$(INTDIR)\HTLine.obj" \
	"$(INTDIR)\HTMLPDTD.obj" \
	"$(INTDIR)\HTProfil.obj" \
	"..\..\..\Bin\wwwapp.lib" \
	"..\..\..\Bin\wwwcache.lib" \
	"..\..\..\Bin\wwwcore.lib" \
	"..\..\..\Bin\wwwdir.lib" \
	"..\..\..\Bin\wwwdll.lib" \
	"..\..\..\Bin\wwwfile.lib" \
	"..\..\..\Bin\wwwftp.lib" \
	"..\..\..\Bin\wwwgophe.lib" \
	"..\..\..\Bin\wwwhtml.lib" \
	"..\..\..\Bin\wwwhttp.lib" \
	"..\..\..\Bin\wwwmime.lib" \
	"..\..\..\Bin\wwwnews.lib" \
	"..\..\..\Bin\wwwstream.lib" \
	"..\..\..\Bin\wwwtelnt.lib" \
	"..\..\..\Bin\wwwtrans.lib" \
	"..\..\..\Bin\wwwutils.lib" \
	"..\..\..\Bin\wwwwais.lib" \
	"..\..\..\Bin\wwwzip.lib"

"..\..\..\Bin\Release\comline.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\..\..\Bin\Debug"
# PROP Intermediate_Dir "..\..\..\Bin\Debug"
# PROP Target_Dir ""
OUTDIR=.\..\..\..\Bin\Debug
INTDIR=.\..\..\..\Bin\Debug

ALL : "$(OUTDIR)\comline.exe" "$(OUTDIR)\comline.bsc"

CLEAN : 
	-@erase "$(INTDIR)\HTBInit.obj"
	-@erase "$(INTDIR)\HTBInit.sbr"
	-@erase "$(INTDIR)\HTInit.obj"
	-@erase "$(INTDIR)\HTInit.sbr"
	-@erase "$(INTDIR)\HTLine.obj"
	-@erase "$(INTDIR)\HTLine.sbr"
	-@erase "$(INTDIR)\HTMLPDTD.obj"
	-@erase "$(INTDIR)\HTMLPDTD.sbr"
	-@erase "$(INTDIR)\HTProfil.obj"
	-@erase "$(INTDIR)\HTProfil.sbr"
	-@erase "$(INTDIR)\vc40.idb"
	-@erase "$(INTDIR)\vc40.pdb"
	-@erase "$(OUTDIR)\comline.bsc"
	-@erase "$(OUTDIR)\comline.exe"
	-@erase "$(OUTDIR)\comline.ilk"
	-@erase "$(OUTDIR)\comline.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\..\Library\src" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D "WWW_WIN_DLL" /FR /YX /c
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /Zi /Od /I "..\..\..\Library\src" /D "_DEBUG"\
 /D "WIN32" /D "_CONSOLE" /D "WWW_WIN_DLL" /FR"$(INTDIR)/"\
 /Fp"$(INTDIR)/comline.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\..\..\..\Bin\Debug/
CPP_SBRS=.\..\..\..\Bin\Debug/
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/comline.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\HTBInit.sbr" \
	"$(INTDIR)\HTInit.sbr" \
	"$(INTDIR)\HTLine.sbr" \
	"$(INTDIR)\HTMLPDTD.sbr" \
	"$(INTDIR)\HTProfil.sbr"

"$(OUTDIR)\comline.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=/nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/comline.pdb" /debug /machine:I386 /out:"$(OUTDIR)/comline.exe" 
LINK32_OBJS= \
	"$(INTDIR)\HTBInit.obj" \
	"$(INTDIR)\HTInit.obj" \
	"$(INTDIR)\HTLine.obj" \
	"$(INTDIR)\HTMLPDTD.obj" \
	"$(INTDIR)\HTProfil.obj" \
	"..\..\..\Bin\wwwapp.lib" \
	"..\..\..\Bin\wwwcache.lib" \
	"..\..\..\Bin\wwwcore.lib" \
	"..\..\..\Bin\wwwdir.lib" \
	"..\..\..\Bin\wwwdll.lib" \
	"..\..\..\Bin\wwwfile.lib" \
	"..\..\..\Bin\wwwftp.lib" \
	"..\..\..\Bin\wwwgophe.lib" \
	"..\..\..\Bin\wwwhtml.lib" \
	"..\..\..\Bin\wwwhttp.lib" \
	"..\..\..\Bin\wwwmime.lib" \
	"..\..\..\Bin\wwwnews.lib" \
	"..\..\..\Bin\wwwstream.lib" \
	"..\..\..\Bin\wwwtelnt.lib" \
	"..\..\..\Bin\wwwtrans.lib" \
	"..\..\..\Bin\wwwutils.lib" \
	"..\..\..\Bin\wwwwais.lib" \
	"..\..\..\Bin\wwwzip.lib"

"$(OUTDIR)\comline.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

################################################################################
# Begin Target

# Name "comline - Win32 Release"
# Name "comline - Win32 Debug"

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwapp.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwcore.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwdir.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwfile.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwdll.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwftp.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwgophe.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwhttp.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwmime.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwnews.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwstream.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwtelnt.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwtrans.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwutils.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwwais.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Library\src\HTBInit.c
DEP_CPP_HTBIN=\
	"..\..\..\Library\src\HTHstMan.h"\
	"..\..\..\Library\src\HTMemLog.h"\
	"..\..\..\Library\src\HTResponse.h"\
	"..\..\..\Library\src\windows\config.h"\
	".\..\..\..\Library\src\HTAlert.h"\
	".\..\..\..\Library\src\HTAnchor.h"\
	".\..\..\..\Library\src\HTArray.h"\
	".\..\..\..\Library\src\HTAssoc.h"\
	".\..\..\..\Library\src\HTAtom.h"\
	".\..\..\..\Library\src\HTBind.h"\
	".\..\..\..\Library\src\HTBInit.h"\
	".\..\..\..\Library\src\HTChannl.h"\
	".\..\..\..\Library\src\HTChunk.h"\
	".\..\..\..\Library\src\HTDNS.h"\
	".\..\..\..\Library\src\HTError.h"\
	".\..\..\..\Library\src\HTEscape.h"\
	".\..\..\..\Library\src\HTEvent.h"\
	".\..\..\..\Library\src\HTFormat.h"\
	".\..\..\..\Library\src\HTFWrite.h"\
	".\..\..\..\Library\src\HTHost.h"\
	".\..\..\..\Library\src\HTInet.h"\
	".\..\..\..\Library\src\HTIOStream.h"\
	".\..\..\..\Library\src\HTLib.h"\
	".\..\..\..\Library\src\HTLink.h"\
	".\..\..\..\Library\src\HTList.h"\
	".\..\..\..\Library\src\HTMemory.h"\
	".\..\..\..\Library\src\HTMethod.h"\
	".\..\..\..\Library\src\HTNet.h"\
	".\..\..\..\Library\src\HTParse.h"\
	".\..\..\..\Library\src\HTProt.h"\
	".\..\..\..\Library\src\HTReq.h"\
	".\..\..\..\Library\src\HTStream.h"\
	".\..\..\..\Library\src\HTString.h"\
	".\..\..\..\Library\src\HTStruct.h"\
	".\..\..\..\Library\src\HTTrans.h"\
	".\..\..\..\Library\src\HTUser.h"\
	".\..\..\..\Library\src\HTUtils.h"\
	".\..\..\..\Library\src\HTUTree.h"\
	".\..\..\..\Library\src\HTUU.h"\
	".\..\..\..\Library\src\HTWWWStr.h"\
	".\..\..\..\Library\src\sysdep.h"\
	".\..\..\..\Library\src\WWWCore.h"\
	".\..\..\..\Library\src\WWWUtil.h"\
	{$(INCLUDE)}"\sys\STAT.H"\
	{$(INCLUDE)}"\sys\TYPES.H"\
	
NODEP_CPP_HTBIN=\
	"..\..\..\Library\src\HTVMSUtils.h"\
	

!IF  "$(CFG)" == "comline - Win32 Release"


"$(INTDIR)\HTBInit.obj" : $(SOURCE) $(DEP_CPP_HTBIN) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "comline - Win32 Debug"


BuildCmds= \
	$(CPP) $(CPP_PROJ) $(SOURCE) \
	

"$(INTDIR)\HTBInit.obj" : $(SOURCE) $(DEP_CPP_HTBIN) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\HTBInit.sbr" : $(SOURCE) $(DEP_CPP_HTBIN) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Library\src\HTInit.c
DEP_CPP_HTINI=\
	"..\..\..\Library\src\HTCache.h"\
	"..\..\..\Library\src\HTDemux.h"\
	"..\..\..\Library\src\HTEvtLst.h"\
	"..\..\..\Library\src\HTHstMan.h"\
	"..\..\..\Library\src\HTMemLog.h"\
	"..\..\..\Library\src\HTMerge.h"\
	"..\..\..\Library\src\HTMuxCh.h"\
	"..\..\..\Library\src\HTMuxHeader.h"\
	"..\..\..\Library\src\HTMuxTx.h"\
	"..\..\..\Library\src\HTNewsRq.h"\
	"..\..\..\Library\src\HTPEP.h"\
	"..\..\..\Library\src\HTResponse.h"\
	"..\..\..\Library\src\HTZip.h"\
	"..\..\..\Library\src\windows\config.h"\
	"..\..\..\Library\src\WWWApp.h"\
	"..\..\..\Library\src\WWWCache.h"\
	"..\..\..\Library\src\WWWFile.h"\
	"..\..\..\Library\src\WWWFTP.h"\
	"..\..\..\Library\src\WWWGophe.h"\
	"..\..\..\Library\src\WWWHTML.h"\
	"..\..\..\Library\src\WWWHTTP.h"\
	"..\..\..\Library\src\WWWLib.h"\
	"..\..\..\Library\src\WWWMIME.h"\
	"..\..\..\Library\src\WWWMux.h"\
	"..\..\..\Library\src\WWWNews.h"\
	"..\..\..\Library\src\WWWStream.h"\
	"..\..\..\Library\src\WWWTrans.h"\
	"..\..\..\Library\src\WWWZip.h"\
	".\..\..\..\Library\src\HTAABrow.h"\
	".\..\..\..\Library\src\HTAAUtil.h"\
	".\..\..\..\Library\src\HTAccess.h"\
	".\..\..\..\Library\src\HTAlert.h"\
	".\..\..\..\Library\src\HTAnchor.h"\
	".\..\..\..\Library\src\HTANSI.h"\
	".\..\..\..\Library\src\HTArray.h"\
	".\..\..\..\Library\src\HTAssoc.h"\
	".\..\..\..\Library\src\HTAtom.h"\
	".\..\..\..\Library\src\HTBind.h"\
	".\..\..\..\Library\src\HTBound.h"\
	".\..\..\..\Library\src\HTBufWrt.h"\
	".\..\..\..\Library\src\HTChannl.h"\
	".\..\..\..\Library\src\HTChunk.h"\
	".\..\..\..\Library\src\HTConLen.h"\
	".\..\..\..\Library\src\HTDescpt.h"\
	".\..\..\..\Library\src\HTDialog.h"\
	".\..\..\..\Library\src\HTDir.h"\
	".\..\..\..\Library\src\HTDNS.h"\
	".\..\..\..\Library\src\HTError.h"\
	".\..\..\..\Library\src\HTEscape.h"\
	".\..\..\..\Library\src\HTEvent.h"\
	".\..\..\..\Library\src\HTFile.h"\
	".\..\..\..\Library\src\HTFilter.h"\
	".\..\..\..\Library\src\HTFormat.h"\
	".\..\..\..\Library\src\HTFTP.h"\
	".\..\..\..\Library\src\HTFTPDir.h"\
	".\..\..\..\Library\src\HTFWrite.h"\
	".\..\..\..\Library\src\HTGopher.h"\
	".\..\..\..\Library\src\HTGuess.h"\
	".\..\..\..\Library\src\HTHeader.h"\
	".\..\..\..\Library\src\HTHist.h"\
	".\..\..\..\Library\src\HTHome.h"\
	".\..\..\..\Library\src\HTHost.h"\
	".\..\..\..\Library\src\HTIcons.h"\
	".\..\..\..\Library\src\HTInet.h"\
	".\..\..\..\Library\src\HTInit.h"\
	".\..\..\..\Library\src\HTIOStream.h"\
	".\..\..\..\Library\src\HTLib.h"\
	".\..\..\..\Library\src\HTLink.h"\
	".\..\..\..\Library\src\HTList.h"\
	".\..\..\..\Library\src\HTLocal.h"\
	".\..\..\..\Library\src\HTLog.h"\
	".\..\..\..\Library\src\HTMemory.h"\
	".\..\..\..\Library\src\HTMethod.h"\
	".\..\..\..\Library\src\HTMIME.h"\
	".\..\..\..\Library\src\HTMIMERq.h"\
	".\..\..\..\Library\src\HTMIMImp.h"\
	".\..\..\..\Library\src\HTMLGen.h"\
	".\..\..\..\Library\src\HTMLPDTD.h"\
	".\..\..\..\Library\src\HTMulpar.h"\
	".\..\..\..\Library\src\HTMulti.h"\
	".\..\..\..\Library\src\HTMux.h"\
	".\..\..\..\Library\src\HTNDir.h"\
	".\..\..\..\Library\src\HTNet.h"\
	".\..\..\..\Library\src\HTNews.h"\
	".\..\..\..\Library\src\HTNewsLs.h"\
	".\..\..\..\Library\src\HTParse.h"\
	".\..\..\..\Library\src\HTProt.h"\
	".\..\..\..\Library\src\HTProxy.h"\
	".\..\..\..\Library\src\HTReader.h"\
	".\..\..\..\Library\src\HTReq.h"\
	".\..\..\..\Library\src\HTRules.h"\
	".\..\..\..\Library\src\HTSChunk.h"\
	".\..\..\..\Library\src\HTSocket.h"\
	".\..\..\..\Library\src\HTStream.h"\
	".\..\..\..\Library\src\HTString.h"\
	".\..\..\..\Library\src\HTStruct.h"\
	".\..\..\..\Library\src\HTTChunk.h"\
	".\..\..\..\Library\src\HTTCP.h"\
	".\..\..\..\Library\src\HTTee.h"\
	".\..\..\..\Library\src\HTTelnet.h"\
	".\..\..\..\Library\src\HTTeXGen.h"\
	".\..\..\..\Library\src\HTTP.h"\
	".\..\..\..\Library\src\HTTPGen.h"\
	".\..\..\..\Library\src\HTTPReq.h"\
	".\..\..\..\Library\src\HTTPRes.h"\
	".\..\..\..\Library\src\HTTPServ.h"\
	".\..\..\..\Library\src\HTTPUtil.h"\
	".\..\..\..\Library\src\HTTrans.h"\
	".\..\..\..\Library\src\HTUser.h"\
	".\..\..\..\Library\src\HTUtils.h"\
	".\..\..\..\Library\src\HTUTree.h"\
	".\..\..\..\Library\src\HTUU.h"\
	".\..\..\..\Library\src\HTWAIS.h"\
	".\..\..\..\Library\src\HTWriter.h"\
	".\..\..\..\Library\src\HTWWWStr.h"\
	".\..\..\..\Library\src\HTXParse.h"\
	".\..\..\..\Library\src\SGML.h"\
	".\..\..\..\Library\src\sysdep.h"\
	".\..\..\..\Library\src\WWWCore.h"\
	".\..\..\..\Library\src\WWWDir.h"\
	".\..\..\..\Library\src\WWWTelnt.h"\
	".\..\..\..\Library\src\WWWUtil.h"\
	".\..\..\..\Library\src\WWWWAIS.h"\
	{$(INCLUDE)}"\sys\STAT.H"\
	{$(INCLUDE)}"\sys\TYPES.H"\
	
NODEP_CPP_HTINI=\
	"..\..\..\Library\src\HTVMSUtils.h"\
	

!IF  "$(CFG)" == "comline - Win32 Release"


"$(INTDIR)\HTInit.obj" : $(SOURCE) $(DEP_CPP_HTINI) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "comline - Win32 Debug"


BuildCmds= \
	$(CPP) $(CPP_PROJ) $(SOURCE) \
	

"$(INTDIR)\HTInit.obj" : $(SOURCE) $(DEP_CPP_HTINI) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\HTInit.sbr" : $(SOURCE) $(DEP_CPP_HTINI) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Library\src\HTMLPDTD.c
DEP_CPP_HTMLP=\
	"..\..\..\Library\src\windows\config.h"\
	".\..\..\..\Library\src\HTArray.h"\
	".\..\..\..\Library\src\HTList.h"\
	".\..\..\..\Library\src\HTMemory.h"\
	".\..\..\..\Library\src\HTMLPDTD.h"\
	".\..\..\..\Library\src\HTStream.h"\
	".\..\..\..\Library\src\HTStruct.h"\
	".\..\..\..\Library\src\HTUtils.h"\
	".\..\..\..\Library\src\SGML.h"\
	".\..\..\..\Library\src\sysdep.h"\
	{$(INCLUDE)}"\sys\STAT.H"\
	{$(INCLUDE)}"\sys\TYPES.H"\
	
NODEP_CPP_HTMLP=\
	"..\..\..\Library\src\HTVMSUtils.h"\
	

!IF  "$(CFG)" == "comline - Win32 Release"


"$(INTDIR)\HTMLPDTD.obj" : $(SOURCE) $(DEP_CPP_HTMLP) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "comline - Win32 Debug"


BuildCmds= \
	$(CPP) $(CPP_PROJ) $(SOURCE) \
	

"$(INTDIR)\HTMLPDTD.obj" : $(SOURCE) $(DEP_CPP_HTMLP) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\HTMLPDTD.sbr" : $(SOURCE) $(DEP_CPP_HTMLP) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Library\src\HTProfil.c
DEP_CPP_HTPRO=\
	"..\..\..\Library\src\HTCache.h"\
	"..\..\..\Library\src\HTEvtLst.h"\
	"..\..\..\Library\src\HTHstMan.h"\
	"..\..\..\Library\src\HTMemLog.h"\
	"..\..\..\Library\src\HTMerge.h"\
	"..\..\..\Library\src\HTNewsRq.h"\
	"..\..\..\Library\src\HTPEP.h"\
	"..\..\..\Library\src\HTResponse.h"\
	"..\..\..\Library\src\HTZip.h"\
	"..\..\..\Library\src\windows\config.h"\
	"..\..\..\Library\src\WWWApp.h"\
	"..\..\..\Library\src\WWWCache.h"\
	"..\..\..\Library\src\WWWFile.h"\
	"..\..\..\Library\src\WWWFTP.h"\
	"..\..\..\Library\src\WWWGophe.h"\
	"..\..\..\Library\src\WWWHTML.h"\
	"..\..\..\Library\src\WWWHTTP.h"\
	"..\..\..\Library\src\WWWInit.h"\
	"..\..\..\Library\src\WWWLib.h"\
	"..\..\..\Library\src\WWWMIME.h"\
	"..\..\..\Library\src\WWWNews.h"\
	"..\..\..\Library\src\WWWStream.h"\
	"..\..\..\Library\src\WWWTrans.h"\
	"..\..\..\Library\src\WWWZip.h"\
	".\..\..\..\Library\src\HTAABrow.h"\
	".\..\..\..\Library\src\HTAAUtil.h"\
	".\..\..\..\Library\src\HTAccess.h"\
	".\..\..\..\Library\src\HTAlert.h"\
	".\..\..\..\Library\src\HTAnchor.h"\
	".\..\..\..\Library\src\HTANSI.h"\
	".\..\..\..\Library\src\HTArray.h"\
	".\..\..\..\Library\src\HTAssoc.h"\
	".\..\..\..\Library\src\HTAtom.h"\
	".\..\..\..\Library\src\HTBind.h"\
	".\..\..\..\Library\src\HTBInit.h"\
	".\..\..\..\Library\src\HTBound.h"\
	".\..\..\..\Library\src\HTBufWrt.h"\
	".\..\..\..\Library\src\HTChannl.h"\
	".\..\..\..\Library\src\HTChunk.h"\
	".\..\..\..\Library\src\HTConLen.h"\
	".\..\..\..\Library\src\HTDescpt.h"\
	".\..\..\..\Library\src\HTDialog.h"\
	".\..\..\..\Library\src\HTDir.h"\
	".\..\..\..\Library\src\HTDNS.h"\
	".\..\..\..\Library\src\HTError.h"\
	".\..\..\..\Library\src\HTEscape.h"\
	".\..\..\..\Library\src\HTEvent.h"\
	".\..\..\..\Library\src\HTFile.h"\
	".\..\..\..\Library\src\HTFilter.h"\
	".\..\..\..\Library\src\HTFormat.h"\
	".\..\..\..\Library\src\HTFTP.h"\
	".\..\..\..\Library\src\HTFTPDir.h"\
	".\..\..\..\Library\src\HTFWrite.h"\
	".\..\..\..\Library\src\HTGopher.h"\
	".\..\..\..\Library\src\HTGuess.h"\
	".\..\..\..\Library\src\HTHeader.h"\
	".\..\..\..\Library\src\HTHInit.h"\
	".\..\..\..\Library\src\HTHist.h"\
	".\..\..\..\Library\src\HTHome.h"\
	".\..\..\..\Library\src\HTHost.h"\
	".\..\..\..\Library\src\HTIcons.h"\
	".\..\..\..\Library\src\HTInet.h"\
	".\..\..\..\Library\src\HTInit.h"\
	".\..\..\..\Library\src\HTIOStream.h"\
	".\..\..\..\Library\src\HTLib.h"\
	".\..\..\..\Library\src\HTLink.h"\
	".\..\..\..\Library\src\HTList.h"\
	".\..\..\..\Library\src\HTLocal.h"\
	".\..\..\..\Library\src\HTLog.h"\
	".\..\..\..\Library\src\HTMemory.h"\
	".\..\..\..\Library\src\HTMethod.h"\
	".\..\..\..\Library\src\HTMIME.h"\
	".\..\..\..\Library\src\HTMIMERq.h"\
	".\..\..\..\Library\src\HTMIMImp.h"\
	".\..\..\..\Library\src\HTML.h"\
	".\..\..\..\Library\src\HTMLGen.h"\
	".\..\..\..\Library\src\HTMLPDTD.h"\
	".\..\..\..\Library\src\HTMulpar.h"\
	".\..\..\..\Library\src\HTMulti.h"\
	".\..\..\..\Library\src\HTNDir.h"\
	".\..\..\..\Library\src\HTNet.h"\
	".\..\..\..\Library\src\HTNews.h"\
	".\..\..\..\Library\src\HTNewsLs.h"\
	".\..\..\..\Library\src\HTParse.h"\
	".\..\..\..\Library\src\HTPlain.h"\
	".\..\..\..\Library\src\HTProfil.h"\
	".\..\..\..\Library\src\HTProt.h"\
	".\..\..\..\Library\src\HTProxy.h"\
	".\..\..\..\Library\src\HTReader.h"\
	".\..\..\..\Library\src\HTReq.h"\
	".\..\..\..\Library\src\HTRules.h"\
	".\..\..\..\Library\src\HTSChunk.h"\
	".\..\..\..\Library\src\HTSocket.h"\
	".\..\..\..\Library\src\HTStream.h"\
	".\..\..\..\Library\src\HTString.h"\
	".\..\..\..\Library\src\HTStruct.h"\
	".\..\..\..\Library\src\HTTChunk.h"\
	".\..\..\..\Library\src\HTTCP.h"\
	".\..\..\..\Library\src\HTTee.h"\
	".\..\..\..\Library\src\HTTelnet.h"\
	".\..\..\..\Library\src\HTTeXGen.h"\
	".\..\..\..\Library\src\HTTP.h"\
	".\..\..\..\Library\src\HTTPGen.h"\
	".\..\..\..\Library\src\HTTPReq.h"\
	".\..\..\..\Library\src\HTTPRes.h"\
	".\..\..\..\Library\src\HTTPServ.h"\
	".\..\..\..\Library\src\HTTPUtil.h"\
	".\..\..\..\Library\src\HTTrans.h"\
	".\..\..\..\Library\src\HTUser.h"\
	".\..\..\..\Library\src\HTUtils.h"\
	".\..\..\..\Library\src\HTUTree.h"\
	".\..\..\..\Library\src\HTUU.h"\
	".\..\..\..\Library\src\HTWAIS.h"\
	".\..\..\..\Library\src\HTWriter.h"\
	".\..\..\..\Library\src\HTWWWStr.h"\
	".\..\..\..\Library\src\HTXParse.h"\
	".\..\..\..\Library\src\SGML.h"\
	".\..\..\..\Library\src\sysdep.h"\
	".\..\..\..\Library\src\WWWCore.h"\
	".\..\..\..\Library\src\WWWDir.h"\
	".\..\..\..\Library\src\WWWTelnt.h"\
	".\..\..\..\Library\src\WWWUtil.h"\
	".\..\..\..\Library\src\WWWWAIS.h"\
	{$(INCLUDE)}"\sys\STAT.H"\
	{$(INCLUDE)}"\sys\TYPES.H"\
	
NODEP_CPP_HTPRO=\
	"..\..\..\Library\src\HTVMSUtils.h"\
	

!IF  "$(CFG)" == "comline - Win32 Release"


"$(INTDIR)\HTProfil.obj" : $(SOURCE) $(DEP_CPP_HTPRO) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "comline - Win32 Debug"


BuildCmds= \
	$(CPP) $(CPP_PROJ) $(SOURCE) \
	

"$(INTDIR)\HTProfil.obj" : $(SOURCE) $(DEP_CPP_HTPRO) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\HTProfil.sbr" : $(SOURCE) $(DEP_CPP_HTPRO) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwzip.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\HTLine.c
DEP_CPP_HTLIN=\
	"..\..\..\Library\src\HTCache.h"\
	"..\..\..\Library\src\HTEvtLst.h"\
	"..\..\..\Library\src\HTHstMan.h"\
	"..\..\..\Library\src\HTMemLog.h"\
	"..\..\..\Library\src\HTMerge.h"\
	"..\..\..\Library\src\HTNewsRq.h"\
	"..\..\..\Library\src\HTPEP.h"\
	"..\..\..\Library\src\HTResponse.h"\
	"..\..\..\Library\src\HTZip.h"\
	"..\..\..\Library\src\windows\config.h"\
	"..\..\..\Library\src\WWWApp.h"\
	"..\..\..\Library\src\WWWCache.h"\
	"..\..\..\Library\src\WWWFile.h"\
	"..\..\..\Library\src\WWWFTP.h"\
	"..\..\..\Library\src\WWWGophe.h"\
	"..\..\..\Library\src\WWWHTML.h"\
	"..\..\..\Library\src\WWWHTTP.h"\
	"..\..\..\Library\src\WWWInit.h"\
	"..\..\..\Library\src\WWWLib.h"\
	"..\..\..\Library\src\WWWMIME.h"\
	"..\..\..\Library\src\WWWNews.h"\
	"..\..\..\Library\src\WWWStream.h"\
	"..\..\..\Library\src\WWWTrans.h"\
	"..\..\..\Library\src\WWWZip.h"\
	"..\HTLine.h"\
	".\..\..\..\Library\src\HTAABrow.h"\
	".\..\..\..\Library\src\HTAAUtil.h"\
	".\..\..\..\Library\src\HTAccess.h"\
	".\..\..\..\Library\src\HTAlert.h"\
	".\..\..\..\Library\src\HTAnchor.h"\
	".\..\..\..\Library\src\HTANSI.h"\
	".\..\..\..\Library\src\HTArray.h"\
	".\..\..\..\Library\src\HTAssoc.h"\
	".\..\..\..\Library\src\HTAtom.h"\
	".\..\..\..\Library\src\HTBind.h"\
	".\..\..\..\Library\src\HTBInit.h"\
	".\..\..\..\Library\src\HTBound.h"\
	".\..\..\..\Library\src\HTBufWrt.h"\
	".\..\..\..\Library\src\HTChannl.h"\
	".\..\..\..\Library\src\HTChunk.h"\
	".\..\..\..\Library\src\HTConLen.h"\
	".\..\..\..\Library\src\HTDescpt.h"\
	".\..\..\..\Library\src\HTDialog.h"\
	".\..\..\..\Library\src\HTDir.h"\
	".\..\..\..\Library\src\HTDNS.h"\
	".\..\..\..\Library\src\HTError.h"\
	".\..\..\..\Library\src\HTEscape.h"\
	".\..\..\..\Library\src\HTEvent.h"\
	".\..\..\..\Library\src\HTFile.h"\
	".\..\..\..\Library\src\HTFilter.h"\
	".\..\..\..\Library\src\HTFormat.h"\
	".\..\..\..\Library\src\HTFTP.h"\
	".\..\..\..\Library\src\HTFTPDir.h"\
	".\..\..\..\Library\src\HTFWrite.h"\
	".\..\..\..\Library\src\HTGopher.h"\
	".\..\..\..\Library\src\HTGuess.h"\
	".\..\..\..\Library\src\HTHeader.h"\
	".\..\..\..\Library\src\HTHInit.h"\
	".\..\..\..\Library\src\HTHist.h"\
	".\..\..\..\Library\src\HTHome.h"\
	".\..\..\..\Library\src\HTHost.h"\
	".\..\..\..\Library\src\HTIcons.h"\
	".\..\..\..\Library\src\HTInet.h"\
	".\..\..\..\Library\src\HTInit.h"\
	".\..\..\..\Library\src\HTIOStream.h"\
	".\..\..\..\Library\src\HTLib.h"\
	".\..\..\..\Library\src\HTLink.h"\
	".\..\..\..\Library\src\HTList.h"\
	".\..\..\..\Library\src\HTLocal.h"\
	".\..\..\..\Library\src\HTLog.h"\
	".\..\..\..\Library\src\HTMemory.h"\
	".\..\..\..\Library\src\HTMethod.h"\
	".\..\..\..\Library\src\HTMIME.h"\
	".\..\..\..\Library\src\HTMIMERq.h"\
	".\..\..\..\Library\src\HTMIMImp.h"\
	".\..\..\..\Library\src\HTML.h"\
	".\..\..\..\Library\src\HTMLGen.h"\
	".\..\..\..\Library\src\HTMLPDTD.h"\
	".\..\..\..\Library\src\HTMulpar.h"\
	".\..\..\..\Library\src\HTMulti.h"\
	".\..\..\..\Library\src\HTNDir.h"\
	".\..\..\..\Library\src\HTNet.h"\
	".\..\..\..\Library\src\HTNews.h"\
	".\..\..\..\Library\src\HTNewsLs.h"\
	".\..\..\..\Library\src\HTParse.h"\
	".\..\..\..\Library\src\HTPlain.h"\
	".\..\..\..\Library\src\HTProfil.h"\
	".\..\..\..\Library\src\HTProt.h"\
	".\..\..\..\Library\src\HTProxy.h"\
	".\..\..\..\Library\src\HTReader.h"\
	".\..\..\..\Library\src\HTReq.h"\
	".\..\..\..\Library\src\HTRules.h"\
	".\..\..\..\Library\src\HTSChunk.h"\
	".\..\..\..\Library\src\HTSocket.h"\
	".\..\..\..\Library\src\HTStream.h"\
	".\..\..\..\Library\src\HTString.h"\
	".\..\..\..\Library\src\HTStruct.h"\
	".\..\..\..\Library\src\HTTChunk.h"\
	".\..\..\..\Library\src\HTTCP.h"\
	".\..\..\..\Library\src\HTTee.h"\
	".\..\..\..\Library\src\HTTelnet.h"\
	".\..\..\..\Library\src\HTTeXGen.h"\
	".\..\..\..\Library\src\HTTP.h"\
	".\..\..\..\Library\src\HTTPGen.h"\
	".\..\..\..\Library\src\HTTPReq.h"\
	".\..\..\..\Library\src\HTTPRes.h"\
	".\..\..\..\Library\src\HTTPServ.h"\
	".\..\..\..\Library\src\HTTPUtil.h"\
	".\..\..\..\Library\src\HTTrans.h"\
	".\..\..\..\Library\src\HTUser.h"\
	".\..\..\..\Library\src\HTUtils.h"\
	".\..\..\..\Library\src\HTUTree.h"\
	".\..\..\..\Library\src\HTUU.h"\
	".\..\..\..\Library\src\HTWAIS.h"\
	".\..\..\..\Library\src\HTWriter.h"\
	".\..\..\..\Library\src\HTWWWStr.h"\
	".\..\..\..\Library\src\HTXParse.h"\
	".\..\..\..\Library\src\SGML.h"\
	".\..\..\..\Library\src\sysdep.h"\
	".\..\..\..\Library\src\WWWCore.h"\
	".\..\..\..\Library\src\WWWDir.h"\
	".\..\..\..\Library\src\WWWTelnt.h"\
	".\..\..\..\Library\src\WWWUtil.h"\
	".\..\..\..\Library\src\WWWWAIS.h"\
	{$(INCLUDE)}"\sys\STAT.H"\
	{$(INCLUDE)}"\sys\TYPES.H"\
	
NODEP_CPP_HTLIN=\
	"..\..\..\Library\src\HTVMSUtils.h"\
	

!IF  "$(CFG)" == "comline - Win32 Release"


"$(INTDIR)\HTLine.obj" : $(SOURCE) $(DEP_CPP_HTLIN) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "comline - Win32 Debug"


BuildCmds= \
	$(CPP) $(CPP_PROJ) $(SOURCE) \
	

"$(INTDIR)\HTLine.obj" : $(SOURCE) $(DEP_CPP_HTLIN) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\HTLine.sbr" : $(SOURCE) $(DEP_CPP_HTLIN) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwcache.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=..\..\..\Bin\wwwhtml.lib

!IF  "$(CFG)" == "comline - Win32 Release"

!ELSEIF  "$(CFG)" == "comline - Win32 Debug"

!ENDIF 

# End Source File
# End Target
# End Project
################################################################################