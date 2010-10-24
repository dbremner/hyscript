@echo off

REM
Setlocal ENABLEDELAYEDEXPANSION

REM
color 02

REM
set origin=This is the origin text!

echo origin : %origin%


REM
REM
REM
set sub=%origin:origin=sub%

echo sub    : %sub%

REM
REM
REM
set cut=%origin:~0,4%
echo cut    : %cut%
echo cut2   : %origin:~5%



REM
set /a length=0
call :STRING_LENGTH "%origin%"
echo length of origin: %length%


REM
GOTO END

REM
:STRING_LENGTH
REM set /a num=0
set str=%1
REM
REM get rid of double quotation marks
REM
set "str=%str:"=%"

:next_char
if not "xx%str%"=="xx" (
  set /a length+=1
  set str=%str:~1%
  goto next_char
)

goto END
REM
REM
REM

:END
