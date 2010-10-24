@echo off

setlocal EnableDelayedExpansion

set bb=
set str=
set x=
set y=

set /p str=str=
set /p x=x=
set /p y=y=
set bb=!str:%x%=%y%!
echo %bb%

pause