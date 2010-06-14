@echo off

set LUA_INCDIR="E:\ulib-win\thirdparty\include\lua"
set LUA_LIBDIR=E:\ulib-win\thirdparty\lib

gcc -O2 -mno-cygwin -shared vec3.c -o vec3.dll  -I%LUA_INCDIR% E:\ulib-win\thirdparty\lib\liblua.dll.a

@pause
