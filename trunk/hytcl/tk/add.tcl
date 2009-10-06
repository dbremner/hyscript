# add.tcl
label .title -text "Visual Adder"
scale .x -to 100 -length 100 -label "x" -orient horizontal
scale .y -to 100 -length 100 -label "y" -orient horizontal
scale .total -to 200 -length 200 -label "total = x + y" -orient horizontal
button .add -text "Add" -command settotal
button .quit -text "Quit" -command exit

bind .x <Button1-Motion> settotal
bind .y <Button1-Motion> settotal

proc settotal {} {
    .total set [expr "[.x get] + [.y get]"]
}

pack .x;
pack .y;
pack .add;
pack .total;
pack .quit;
