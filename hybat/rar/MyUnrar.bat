@echo off

REM
color 02

REM
set PATH=C:\Program Files\WinRAR;%path%

REM
for /r . %%a in (.) do (
echo ===Uncompress Zip File===
IF EXIST "%%a\*.zip" WinRar e "%%a\*.zip"  *.r*
IF EXIST *.rar WinRar e -o- -y *.rar *.chm
IF EXIST *.rar WinRar e -o- -y *.rar *.pdf
echo ===Delete Rar File===
IF EXIST *.rar ERASE *.r*
)

@pause
