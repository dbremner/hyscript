set types {
        {"All Source Files"     {.tcl .c .h}    }
        {"Image Files"          {.gif}          }
        {"All files"            *}
}

proc doIt {label} {
    global types   
    set file [tk_getOpenFile -filetypes $types -parent .]
    $label configure -text $file
}

label .l -text "No File"
button .b -text "Select a file?" \
        -command "doIt .l"

grid .b -row 0 -column 0
grid .l -row 1 -column 1

