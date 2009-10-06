@echo off

rem
rem
rem
rem
rem

echo "Set IP to 59.66.172.49"

netsh interface ip set address "Local Area Connection" static 59.66.172.49 255.255.255.0 59.66.172.1 1

rem netsh interface ip set dns  "Local Area Connection" static 166.111.8.28166.111.8.29 primary

echo "Clear previous DNS"
netsh interface ip delete dns  "Local Area Connection"  all

echo "Add DNS 166.111.8.28"
netsh interface ip add dns "Local Area Connection" 166.111.8.28

echo "Add DNS 166.111.8.29"
netsh interface ip add dns "Local Area Connection" 166.111.8.29 index=2

@pause
