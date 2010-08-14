::catch {};#\
@echo off
::catch {};#\
@"D:/Progs/MinGW/ThirdParty/tcl84/bin/wish84.exe" %0 %*
::catch {};#\
@goto :eof

#
button .hello -text "Hello, world" -command {
    puts stdout "Hello, world"; destroy .
}
pack .hello
#\

