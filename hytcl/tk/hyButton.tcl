#!/usr/bin/wish

#
. configure -width 200 -height 400

#
button .hello -text "Hello, world" \
   -command {
       puts stdout "Hello, world"; destroy .
  }

button .goodbye -text Bye! \
   -command {exit}

pack .hello -padx 60 -pady 5
pack .goodbye -padx 60 -pady 5

