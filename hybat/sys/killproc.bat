@echo off

taskkill /f /im TSVNCache.exe

ntsd -c q -pn TSVNCache.exe
 
wmic process where name="TSVNCache.exe" call terminate

pause > NUL
