#!/usr/bin/tclsh

#
# Demonstrate Data Structures
# using procedural wrappers
proc UserAdd { Acct rName eMail phone } {
  global uData
  if {[info exists uData($Acct,rname)]} {
    return 1
  }
  set uData($Acct,rname) $rName
  set uData($Acct,email) $eMail
  set uData($Acct,phone) $phone
  return 0
}

puts stdout [UserAdd bpb\
  Brian bilbrey@junk.com 555-1212]
puts stdout [UserAdd tom\
  Tom tom@junk.com 555-1212]
puts stdout [UserAdd bpb\
  Brian bilbrey@junk.com 555-1212]

#
puts stdout "Press any key to continue..."
gets stdin line

