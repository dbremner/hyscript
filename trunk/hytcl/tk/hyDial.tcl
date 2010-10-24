#

wm withdraw .

button .checknow -text "Check Number of Users" -command docheck
dial .number -maxvalue 30 -numticks 30
button .quit -text "Quit" -command exit

set num 5

.number set $num
  
proc docheck {} {
  global num
  if ($num > 10)
  {
    set num [expr $num-5]
  }
  else
  {
    set num [expr $num+1]
  }

}

pack .checknow
pack .number
pack .quit

proc keepchecking {} {
    refresh
    after 60000 keepchecking
}

keepchecking
