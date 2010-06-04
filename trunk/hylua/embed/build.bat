@echo off

set LUA_INCDIR="E:\ulib-win\thirdparty\include\lua"
set LUA_LIBDIR=E:\ulib-win\thirdparty\lib

g++ -O2 -mno-cygwin hello.cpp -o hello.exe  -I%LUA_INCDIR% E:\ulib-win\thirdparty\bin/lua51.dll

@pause
