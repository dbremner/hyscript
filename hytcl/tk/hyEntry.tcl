#entry .e -width 100 -background "orange red" -justify center -textvariable evar

#set evar "Hello Entry"

#pack .e -expand yes -fill both

# Creates an entry that you can type in. 
# focus puts the cursor in the entry, and he button clears it

label .l -text "Enter:"
entry .e -width 40 -relief sunken -bd 2 -textvariable name
focus .e
button .b -text Clear -command {set name ""}

grid .l -row 0 -column 0 -sticky e
grid .e -row 0 -column 1 -sticky w
grid .b -row 1 -column 0 -columnspan 2

