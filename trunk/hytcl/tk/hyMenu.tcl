#wm withdraw .

option add *tearOff 0

#toplevel .win
menu .menubar
. configure -menu .menubar

set m .menubar
menu $m.file
menu $m.edit
$m add cascade -menu $m.file -label File
$m add cascade -menu $m.edit -label Edit

$m.file add command -label "New" -command "newFile"	
$m.file add separator
$m.file add command -label "Open..." -command "openFile"
$m.file add command -label "Close" -command "closeFile"

$m.file add checkbutton -label Check -variable check -onvalue 1 -offvalue 0
$m.file add radiobutton -label One -variable radio -value 1
$m.file add radiobutton -label Two -variable radio -value 2

if {"win32" == [tk windowingsystem]} {
    wm iconbitmap . "u.ico"
}

#destroy .