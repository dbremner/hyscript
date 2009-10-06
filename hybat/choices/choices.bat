@echo off

color 02

:input
echo ============================
echo                1 xxx
echo                2 yyy
echo                3 zzz
echo                q quit
echo ============================

set choice=
set /p choice=Please input your choice: 
if "%choice%"=="q" goto finished
if "%choice%"=="1" echo 1.txt && goto input
if "%choice%"=="2" echo 2.txt && goto input
if "%choice%"=="3" echo 3.txt && goto input
REM else
echo *** Invalid Option!
goto input

:finished
echo Finished

@pause
