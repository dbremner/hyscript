#!/bin/sh
#-*-tcl-*-
# the next line restarts using wish \
exec wish "$0" -- ${1+"$@"}

proc Serve {chan addr port} {
    fconfigure $chan -translation auto -buffering line
    set line [gets $chan]
    set path [file join . [string trimleft [lindex $line 1] /]]
    if { [catch {
     set fl [open $path]
    } err] } {
        puts $chan "HTTP/1.0 404 Not Found"
    } else {
        puts $chan "HTTP/1.0 200 OK"
     puts $chan "Content-Type: text/html"
     puts $chan ""
     puts $chan [read $fl]
     close $fl
    }
    close $chan
}
set sk [socket -server Serve 5151]
vwait forever
