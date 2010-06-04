@echo off

set LUA_INCDIR="E:\ulib-win\thirdparty\include\lua"
set LUA_LIBDIR=E:\ulib-win\thirdparty\lib

gcc -O2 -mno-cygwin -nostdlib -shared -s hello.c -o helloc.dll -luser32 -I%LUA_INCDIR% E:\ulib-win\thirdparty\bin/lua51.dll -Wl,-e,_DllMain@12 -Wl,--dll -nostartfiles

@pause
