@echo off

rem
rem
rem
rem
rem

REM =================================
set IFNAME="Local Area Connection"
set IPADDR="166.111.37.28"
set GATEWAY="166.111.36.1"
set DNSADDR1="166.111.8.28"
set DNSADDR2="166.111.8.29"
REM =================================

echo "Set IP to %IPADDR%"

netsh interface ip set address %IFNAME% static %IPADDR% 255.255.254.0 %GATEWAY% 1

echo "Clear previous DNS"
netsh interface ip delete dns %IFNAME%" all

echo "Add DNS 166.111.8.28"
netsh interface ip add dns %IFNAME% %DNSADDR1%

echo "Add DNS 166.111.8.29"
netsh interface ip add dns %IFNAME% %DNSADDR2% index=2

@pause
