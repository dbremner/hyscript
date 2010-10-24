#!/usr/bin/tclsh

#
set PI [expr 2 * asin(1.0)]

proc circum {rad} {
  global PI
  return [expr 2.0 * $rad * $PI]
}

#
proc c_area {rad} {
  global PI
  return [expr $rad * $rad * $PI]
}

#
set rad 3

#
puts stdout "Area of circle of\
radius $rad is [c_area $rad], \
the circumference is\
[circum $rad].\n"

#
puts stdout "Press any key to continue..."
gets stdin line

