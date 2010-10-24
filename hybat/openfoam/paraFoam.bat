@echo off

REM
Setlocal ENABLEDELAYEDEXPANSION

REM ========================================================================================
set PATH=D:\Progs\cfd\OpenFOAM-1.5\bin;D:\Progs\cfd\graphics\Paraview-3.4.0\bin;%PATH%
set PV_PLUGIN_PATH=D:\Progs\cfd\OpenFOAM-1.5\bin\plugins\paraview

set CWD=%CD%

set FOAM_FILE=
set WORKING_DIR=
REM ========================================================================================

REM ========================================================================================
if not ""=="%1" (
    set WORKING_DIR=%1
) else (
    set WORKING_DIR=%CWD%
)

REM ========================================================================================
call :CUT_STRING %WORKING_DIR%

REM ========================================================================================
echo %FOAM_FILE%

REM ========================================================================================
:CHECK_FILES
if not exist %WORKING_DIR%\system\controlDict goto ERROR_CHECK_FILES
if not exist %WORKING_DIR%\system\fvSchemes   goto ERROR_CHECK_FILES
if not exist %WORKING_DIR%\system\fvSolution  goto ERROR_CHECK_FILES

REM ========================================================================================
if not exist %WORKING_DIR%\%FOAM_FILE%.OpenFOAM echo >%WORKING_DIR%\%FOAM_FILE%.OpenFOAM

REM ========================================================================================
chdir %WORKING_DIR%

REM ========================================================================================
call paraview --data=%FOAM_FILE%.OpenFOAM


GOTO END

REM ========================================================================================
:ERROR_CHECK_FILES
echo !!!system files are missing!!!
goto END

REM ========================================================================================
:CUT_STRING
set FOAM_FILE=%~n1

:END
REM DO NOTHING
