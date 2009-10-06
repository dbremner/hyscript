@echo off

rem  ����˵������npp��ӵ��ļ����Ҽ��˵�
rem  �������ڣ�2007.1.18
rem  �޸����ڣ�2009.8.23
rem  ��д�ߣ�hu

rem
set NPP_PATH=D:\\GS\\Notepad++\\notepad++.exe
set NPP_KEYNAME=npp

rem Ҫ��%��Ϊ�ַ�ʹ�ã���ʽΪ�� %%

rem ������ʱ�ļ���
set NPP_TMPDIR=%temp%\npp
IF EXIST %NPP_TMPDIR% rmdir /S /Q %NPP_TMPDIR% >NUL
mkdir %NPP_TMPDIR%

rem ��ȡ��ǰ·��


reg query HKCR\*\shell\%NPP_KEYNAME% >%NPP_TMPDIR%\check.log 2>NUL

reg query HKCR\*\shell\%NPP_KEYNAME%\command >>%NPP_TMPDIR%\check.log 2>NUL

rem find "%NPP_KEYNAME%" %npp%\check.log | find "%NPP_PATH% %%1" >NUL
find "%NPP_PATH% %%1" %npp%\check.log >NUL

IF NOT ERRORLEVEL 1 (
 set isInstalled=true
) else (
 set isInstalled=false
)

rem echo %isInstalled%

if %isInstalled%==true (
    echo Notepad++ is installed.
) else (
    echo Install Notepad++ now.
    reg add HKCR\*\shell\%NPP_KEYNAME% /ve /t REG_SZ /d "%NPP_KEYNAME%" /f >NUL
    reg add HKCR\*\shell\%NPP_KEYNAME%\command   /ve /t REG_SZ /d "%NPP_PATH% %%1" /f >NUL
    IF NOT ERRORLEVEL 1 (
        echo Notepad++ is ready now. 
    )
)


rem ɾ����ʱ�ļ���
rem rmdir /S /Q %npp% >NUL

:END
pause
