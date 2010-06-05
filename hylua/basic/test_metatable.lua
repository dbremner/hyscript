x = { value = 3 }      -- our object

mt = { __add = function (a, b)
                  return { value = a.value + b.value }
                end }  -- metatable containing event callbacks

setmetatable(x, mt)  -- attach our metamethods to our object

a = x + x

print(a.value)

----------------------------------------------------------------

mt = {}  -- metatable

function String(s)
  return setmetatable({ value = s or '' }, mt)
end

function mt.__add(a, b)
  return String(a.value .. b.value)
end

function mt.__mul(a, b)
  return String(string.rep(a.value, b))
end

s = String('hello ')

print(s.value)

print( (s + String('Lua user')).value )  -- concat 2 String instances

print( (s*3).value )

print( (((s + String('Lua user.')))*2).value )  -- use both metamethods


print(s.length)  -- no such key in the String table class

mt.__index = function (t,key)
  if key == 'length' then return string.len(t.value) end
end

print(s.length)  -- new __index event calls the above function

print(s.value, s.length)

mt.__newindex = function (t, key, value)
  error('sorry, the only member is "value"')
end
s.banana = 'yellow'

s.value = 'abc'  -- no error here
