@echo off

REM
Setlocal ENABLEDELAYEDEXPANSION

REM
color 02

set newname=

REM
for %%x in (test_*) do (
  echo %%x
  set newname=%%x

  REM delay expansion here 
  echo newname: !newname:~0,4!
)
goto END
REM
REM
REM

:END
