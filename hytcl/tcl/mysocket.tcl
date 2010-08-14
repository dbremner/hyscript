#!/usr/bin/tclsh

#
set f [socket www.baidu.com 80]
fconfigure $f -buffering line
puts $f "GET /"
puts stdout [read $f 1000]
close $f

#
proc Http_Open {url} {
    global http
    if {![regexp -nocase {^(http://)?([^:/]+)(:([0-9])+)?(/.*)} \
            $url x protocol server y port path]} {
        error "bogus URL: $url"
    }

    if {[string length $port] == 0} {
        set port 80
    }

    set sock [socket $server $port]
    puts $sock "GET $path HTTP/1.0"
    puts $sock "Host: $server"
    puts $sock "User-Agent: Tcl/Tk Http_Open"
    puts $sock ""
    flush $sock
    return $sock
}

set ss [Http_Open "http://www.baidu.com/index.html"]
puts stdout [read $ss 5000]
close $ss

#
puts stdout "Press any key to continue..."
gets stdin line

