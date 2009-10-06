::catch {};#\
@echo off
::catch {};#\
@"D:/GS/mingw4/bin/wish84.exe" %0 %*
::catch {};#\
@goto :eof

#
button .hello -text "Hello, world" -command {
    puts stdout "Hello, world"; destroy .
}
pack .hello
#\

