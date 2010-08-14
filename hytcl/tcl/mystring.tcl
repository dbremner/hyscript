#!/usr/bin/tclsh

#
set Phase "Hello World!"

#
puts stdout "origin: $Phase"

#
puts stdout "upper: [string toupper $Phase]"

#
puts stdout "title: [string totitle $Phase]"

#
puts stdout "match ello: [string match ello $Phase]"
puts stdout "match *ello*: [string match *ello* $Phase]"

#
puts stdout "length: [string length $Phase]"

#
puts stdout "append: [append Phase \
                      { Nice day, eh!}]"

#
puts stdout "Press any key to continue..."
gets stdin line

