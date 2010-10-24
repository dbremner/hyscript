@echo off

REM
REM
REM

echo Command Line Argument Utility

echo narg : %?

set args="%*"

echo %args%

for /F "delims= " %%i in (%args%) do (
  echo %%i
)

call :EXTRACT_ARGS 1 --list 2 3 4 5 6 7 8 9 10 11

goto END

:EXTRACT_ARGS

if "%1"=="" goto END

set arg=%1

if "%arg:~0,1%"=="-" (
  echo %1 %2
  shift
) else (
  echo %1
)

shift
goto EXTRACT_ARGS

:END
