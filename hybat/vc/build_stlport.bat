@echo off

:TEST_CL
cl 2>NUL 1>NUL

if %ERRORLEVEL% EQU 0 goto MAINPROC

:SETUP_ENV
echo Enter Enviroment Setup
rem set VCVARS32="E:\GS\VC6\VC98\Bin\VCVARS32.BAT"
set VCVARS32="D:\GS\VC6\VC98\Bin\VCVARS32.BAT"

rem Setup VC6 Building Environment
if not exist %VCVARS32% goto ERROR_VC
call %VCVARS32% 1>NUL 2>NUL


:MAINPROC
set STLPORT="E:\reading\cpp\stlport"
if not exist %STLPORT% goto ERROR_STLPORT
set STLPORT_INC="%STLPORT%/include/stlport"
set STLPORT_LIB="%STLPORT%/lib"
set CLOPT=/c /nologo /GX /MTd /I%STLPORT_INC%
set LDOPT=/nologo /LIBPATH:%STLPORT_LIB%

if %1==/P goto PREPROCESS
if %1==/C goto COMPILE
if %1==/L goto LINK

set SRC=%1
set OBJ=%SRC:cpp=obj%
set EXE=%SRC:cpp=exe%

echo ************************************************
echo Source    File   : %SRC%
echo Object    File   : %OBJ%
echo Executive File   : %EXE%
echo ************************************************
echo *****

cl %CLOPT% %SRC%
if %ERRORLEVEL% NEQ 0 goto ERROR_COMPILE
echo Compiling passed.

link %LDOPT% %OBJ%
if %ERRORLEVEL% NEQ 0 goto ERROR_LINK
echo Linking passed.

goto END

:PREPROCESS
echo Enter Preprocess===
cl /nologo /P /I%STLPORT_INC% %1
goto END

:COMPILE
echo Enter COMPILE===
cl %CLOPT% %2 %3 %4 %5 %6 %7 %8 %9

if %ERRORLEVEL% NEQ 0 goto ERROR_COMPILE

echo Compiling passed.
goto END

:LINK
echo Enter LINK===
link %LDOPT% %2 %3 %4 %5 %6 %7 %8 %9
if %ERRORLEVEL% NEQ 0 goto ERROR_LINK
echo Linking passed.
goto END

:ERROR_VC
echo There is not %VCVARS32%.
echo Fixed it and run again.
goto END

:ERROR_STLPORT
echo There is not %STLPORT%.
echo Fixed it and run again.
goto END

:ERROR_COMPILE
echo Compiling failed.
echo Fixed it and run again.
goto END

:ERROR_LINK
echo Linking failed.
echo Fixed it and run again.
goto END

:END
rem OK, quit now.
