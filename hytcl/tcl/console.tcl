#!D:/GS/mingw/bin/tclsh
puts stdout {Hello World! \a}
puts stdout "Hello world! \a"
puts "Working Directory: [pwd]"
cd [pwd]/../../
puts "Working Directory: [pwd]"

puts $argc
puts $argv0
if {$argc >= 1} {
    set N 1
    foreach Arg $argv {
        puts stdout "$N: $Arg\n"
    set N [expr $N+1]
    }
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
