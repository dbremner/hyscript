@echo off

rem
rem
rem
rem
rem

echo "Set IP to dhcp"

netsh interface ip set address "Local Area Connection" dhcp

echo "Set DNS to dhcp"
netsh interface ip set dns  "Local Area Connection"  dhcp

@pause
