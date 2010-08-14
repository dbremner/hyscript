#!/usr/bin/tclsh

#
set People(friend) Tom

#
puts stdout [array names People]
puts stdout $People(friend)

#

#
puts stdout "Press any key to continue..."
gets stdin line

