@echo off

Setlocal ENABLEDELAYEDEXPANSION

set c=">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>================================================================================"
for /l %%i in (80,-1,1) do (
  cls
  set /p f=!c:~%%i,80!<nul
  ping/n 1 127.1 >nul
)

pause > nul

for /l %%i in (1,1,20) do echo.
  echo                          win2000 is starting, please wait...
  echo.
  echo.  
  set /p a=">=============================================================================="<nul
  for /l %%i in (1,1,80) do (
    set /p aa= <nul
  )
  for /l %%i in (1,1,80) do (
    set /p aa=^><nul
    ping/n 0 127.1 >nul
  )
for /l %%t in (1 1 10000) do (echo.>nul)
cls

pause > nul
