#!/usr/bin/env lua

--
io.write("Hello world, from ",_VERSION,"!\n")

-- hello.lua
print("Hello World!");

print("one line\nnext line\n\"in quotes\", 'in quotes'");

page = [[
    <HTML>
    <HEAD>
    <TITLE>An HTML Page</TITLE>
    </HEAD>
    <BODY>
     <A HREF="http://www.lua.org">Lua</A>
    </BODY>
    </HTML>
    ]];
    
print(page);

--
line = io.read()     -- read a line
n = tonumber(line)   -- try to convert it to a number
if n == nil then
  error(line .. " is not a valid number")
else
  print(n*2)
end

-- table
a = {}     -- create a table and store its reference in `a'
k = "x"
a[k] = 10        -- new entry, with key="x" and value=10
a[20] = "great"  -- new entry, with key=20 and value="great"
print(a["x"])    --> 10
k = 20
print(a[k])      --> "great"
a["x"] = a["x"] + 1     -- increments entry "x"
print(a["x"])    --> 11
