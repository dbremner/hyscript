#!/usr/bin/tclsh

#
set cl {Bob Carol}

#
puts stdout $cl

#
puts stdout "list length : [llength $cl]"

#
puts stdout "==insert into list"
set cl [linsert $cl 1 Dala]
puts stdout $cl
puts stdout "list length : [llength $cl]"

#
puts stdout "==append to list"
set cl [lappend $cl Eva]
puts stdout $cl
puts stdout "list length : [llength $cl]"

#
puts stdout "Press any key to continue..."
gets stdin line

