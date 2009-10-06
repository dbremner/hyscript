@ECHO OFF

ECHO ============================================================
ECHO Utility for squid
ECHO ============================================================

ECHO check status ......

REM 
SET squid_status=%temp%\\squid_s
IF EXIST %squid_status% (
    RMDIR /S /Q %squid_status% 2>NUL 1>NUL
    MKDIR %squid_status%
) ELSE (
    MKDIR %squid_status%
)


REM
SC QUERY squid>%squid_status%\\log
FIND  "RUNNING" %squid_status%\\log>NUL
IF ERRORLEVEL 1 (
 SC START squid
) ELSE (
 SC STOP squid
)

ECHO ==========================================================
ECHO Finished
ECHO ==========================================================

@PAUSE
