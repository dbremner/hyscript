#!/usr/bin/wish

#
. configure -width 200 -height 400

label .header -text "Tk Tutorial Example"
place .header -x 5 -y 2

scale .slider -from 1 -to 100 -orient horiz
.slider configure -variable SlidVal
place .slider -x 5 -y 20

entry .slidbox -width 5 -textvariable SlidVal
place .slidbox -x 120 -y 38

radiobutton .one -text "Don't Worry" -variable Mood -value "1"
radiobutton .two -text "Be Happy" -variable Mood -value "2"
place .one -x 5 -y 70
place .two -x 5 -y 90
.one select

text .twindow -width 22 -height 14 -font {clean -14}
place .twindow -x 5 -y 120

button .ok -command {process_data $SlidVal} -text "OK"
button .cancel -command {exit} -text "Cancel" -background red
place .ok -x 15 -y 370
place .cancel -x 120 -y 370

