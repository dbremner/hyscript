# hello.tcl
label .title -text "Tcl/Tk Greeting Program" -relief raised
label .response
button .greet -text "Greet" -command {
    .response configure -text "hello, world"
    wm geometry . 300x200+5+40
    wm title . "hello TK!"
}
bind .greet <ButtonPress-2> {.response configure -text "bye for now"}
bind .greet <ButtonPress-3> {.response configure -text "got you"}

pack .title
pack .response
pack .greet

if {"win32" == [tk windowingsystem]} {
    wm iconbitmap . "u.ico"
}
