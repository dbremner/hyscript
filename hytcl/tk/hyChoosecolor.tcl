proc doIt {widget} {
    set current_color \
        [tk_chooseColor -title "Choose a background color" -parent .]
    $widget configure -background $current_color
}
label .l
button .b -text "Choose a color..." \
        -command "doIt .b" 
grid .b -row 0 -column 0

