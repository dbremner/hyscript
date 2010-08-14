#!D:/GS/mingw/bin/tclsh

# curly braces prevent substitution and expansion
puts stdout {Hello World! \a}
puts stdout "Hello world! \a"

puts "Working Directory: [pwd]"
cd [pwd]/../../
puts "Working Directory: [pwd]"

puts "Argument count: $argc"
puts "Argument 0 : $argv0"
if {$argc >= 1} {
    set N 1
    foreach Arg $argv {
        puts stdout "$N: $Arg\n"
    set N [expr $N+1]
    }
} else {
    puts stdout "$argv0 on X Display $env(COMPUTERNAME)\n"
}

# math functions
set PI [expr 2 * asin(1.0)]
if {$argc == 3} {
    set X [lindex $argv 0]
    set Y [lindex $argv 1]
    set Rad [lindex $argv 2]
    set Dist [expr sqrt(($X*$X)+($Y*$Y))]
    set Cir [expr 2*$PI*$Rad]
    set Area [expr $PI*$Rad*$Rad]
    puts stdout "Distance = $Dist"
    puts stdout "Circumference = $Cir"
    puts stdout "Area = $Area"
}

#
proc test {} {
    set a 43
    set b 27
    set c [expr $a + $b]
    set d [expr [expr $a - $b] * $c]
    for {set k 0} {$k < 10} {incr k} {
        if {$k < 5} {
            puts "k < 5, pow = [expr pow($d, $k)]"
        } else {
            puts "k > 5, mod = [expr $d % $k]"
        }
    }
}

#
test

# parse command line switches
set Optimize 0
set Verbose 0
foreach Arg $argv {
    switch -glob -- $Arg {
        -o* {set Optimize 1}
        -v* {set Verbose 1}
        default {
            error "Unknown $Arg"
        }
    }
}

set LineCount 0
while {[gets stdin Line] > 0} {
    puts stdout "$Line -- $Optimize $Verbose"
    incr LineCount
}

return LineCount

