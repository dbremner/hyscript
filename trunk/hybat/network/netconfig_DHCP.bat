@echo off

rem
rem
rem
rem
rem

REM =================================
set IFNAME="Local Area Connection"
REM =================================

echo "Set IP to dhcp"

netsh interface ip set address %IFNAME% dhcp

echo "Set DNS to dhcp"
netsh interface ip set dns %IFNAME% dhcp

@pause
