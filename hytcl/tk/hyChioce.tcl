set font helvetica

proc applyIt { } {
    global bold italics font
    if {$bold} {set weight bold} {set weight normal}
    if {$italics} {set slant italic} {set slant roman}
    .b configure -font "-family $font -weight $weight -slant $slant"
}

checkbutton .c1 -text Bold -variable bold   -anchor w
checkbutton .c2 -text Italics -variable italics  -anchor w

radiobutton .r1 -text Helvetica -variable font -value helvetica
radiobutton .r2 -text Courier   -variable font -value courier   

button .b -text Apply \
    -command "applyIt"

applyIt

#The "sticky" option aligns items to the left (west) side
grid .c1 -row 0 -column 1 -sticky w
grid .c2 -row 1 -column 1 -sticky w
grid .r1 -row 0 -column 0 -sticky w
grid .r2 -row 1 -column 0 -sticky w
grid .b -row 2 -column 0 -columnspan 2


