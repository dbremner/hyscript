@echo off

set LUA_INCDIR="E:\ulib-win\thirdparty\include\lua"
set LUA_LIBDIR=E:\ulib-win\thirdparty\lib

g++ -O2 -mno-cygwin cxxhello.cpp -o cxxhello.exe  -I%LUA_INCDIR% E:\ulib-win\thirdparty\bin/lua51.dll

@pause
