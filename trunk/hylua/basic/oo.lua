#!/usr/bin/env lua
--
t = {}
function t.sayhello(name)
    print ("Hello "..name)
end

t.sayhello("Fred")

t      = {}
t.Name = "Fred"

function t:sayhello()
   print ("Hello "..self.Name)
end

t:sayhello()
-- Or, other expressions that mean the same thing:
t.sayhello(t)
t['sayhello'](t)
