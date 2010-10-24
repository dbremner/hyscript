@echo off

rem
rem
rem
rem
rem

REM =================================
REM set IFNAME="Local Area Connection"
REM set IPADDR="166.111.37.28"
REM set GATEWAY="166.111.36.1"
REM set DNSADDR1="166.111.8.28"
REM set DNSADDR2="166.111.8.29"
set IFNAME="Wireless Network Connection"
set IPADDR="192.168.22.10"
set GATEWAY="192.168.22.44"
set DNSADDR1="202.106.0.20"
set DNSADDR2="8.8.8.8"
REM =================================

echo "Set IP to %IPADDR%"

netsh interface ip set address %IFNAME% static %IPADDR% 255.255.255.0 %GATEWAY% 1

echo "Clear previous DNS"
netsh interface ip delete dns %IFNAME%" all

echo "Add DNS %DNSADDR1%"
netsh interface ip add dns %IFNAME% %DNSADDR1%

echo "Add DNS %DNSADDR2%"
netsh interface ip add dns %IFNAME% %DNSADDR2% index=2

@pause
