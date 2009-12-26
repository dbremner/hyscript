@echo off


REM =====================================
REM
REM
REM
REM +++++++++++++++++++++++++++++++++++++
Setlocal ENABLEDELAYEDEXPANSION

set PWD=%~dp0

REM echo %PWD%

IF "%1" == "-" GOTO L_HIDE
IF "%1" == "+" GOTO L_SHOW ELSE GOTO L_END

:L_SHOW
FOR /F "usebackq" %%i IN (`dir /A:D /B`) DO (
        echo %%i
        attrib -s -h %%i
    )
GOTO L_END

:L_HIDE
FOR /F "usebackq" %%i IN (`dir /A:D /B`) DO (
        echo %%i
        attrib +s +h %%i
    )
GOTO L_END

:L_END
    echo "Happy Day!"

@pause
