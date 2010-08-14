#
# proc
#
proc newFile {} {

}

proc openFile {} {

}

proc closeFile {} {

}

proc exitApp {} {
    destroy .
}

proc showAbout {} {
    tk_dialog .foo   \
              "About" \
              {
                 Do you want to say yes?
                 Do you want to say yes?
                 Do you want to say yes?
              } \
              questhead 0 OK
}

#
wm title . "Text Editor by huys"
wm iconname . "text"

#
# menu
#
option add *tearOff 0

menu .menubar
. configure -menu .menubar

set m .menubar
menu $m.file
menu $m.edit
menu $m.help
$m add cascade -menu $m.file -label File
$m add cascade -menu $m.edit -label Edit
$m add cascade -menu $m.help -label Help

# submenu /file
$m.file add command -label "New" -command "newFile"
$m.file add command -label "Open..." -command "openFile"
$m.file add command -label "Close" -command "closeFile"
$m.file add separator
$m.file add command -label "Exit" -command "exitApp"

# submenu /edit

# submenu /help
$m.help add command -label "About" -command "showAbout"

#
# text
#
text .text -relief sunken -bd 2 -setgrid 1 \
    -height 30 -undo 1 -autosep 1

pack .text -expand yes -fill both
