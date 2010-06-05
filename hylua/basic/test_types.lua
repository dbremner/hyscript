--
print(2+2)
--[[ output:
4
]]

print(2-7)
--[[ output:
5
]]


print(7*8)
--[[ output:
56
]]

print(7/8)
--[[ output:
0.875
]]

x = x * 9
print(x)
print(x*2) -- will not change the value of x
print(x)

who = "Lua user"
print("hello " .. who)

x = {}
print(x)


function foo() print("hello") end -- declare the function
foo() -- call the function
print(foo) -- get the value of the variable "foo"

x = "123"  -- a string
print(x, type(x)) -- show the value of x and its type
--[[ output:
123     string
]]

x = x + 7  -- add a number to the string which forces coercion
print(x, type(x)) -- again show the value and type
--[[ output:
130     number
]]
