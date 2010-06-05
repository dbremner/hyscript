#!/usr/bin/env lua

--
--function double(x) return x*2 end
print( (function(x) return x*2 end)(1) )

--
function dofunction(f) return f(21) end
print( dofunction(double) )

--
function map(func, array)
  local new_array = {}
  for i,v in ipairs(array) do
    new_array[i] = func(v)
  end
  return new_array
end
print( table.concat(map(double, {1,2,3}),",") )

--
function mapn(func, ...)
  local new_array = {}
  local i=1
  local arg_length = table.getn(arg)
  while true do
    local arg_list = map(function(arr) return arr[i] end, arg)
    if table.getn(arg_list) < arg_length then return new_array end
    new_array[i] = func(unpack(arg_list))
    i = i+1
  end
end

t = mapn(function(a,b) return a+b end, {1,2,3}, {4,5,6})
print( table.concat(t,",") )

t = {1,4,2,5,6,7,3}
table.sort(t, function(a,b) return a<b end)
print( table.concat(t,",") )

--
function cdr(arr)
  local new_array = {}
  for i = 2, table.getn(arr) do
    table.insert(new_array, arr[i])
  end
end

function cons(car, cdr)
  local new_array = {car}
  for _,v in cdr do
    table.insert(new_array, v)
  end
  return new_array
end

function lisp_remove_if(func, arr)
  if arr == nil or table.getn(arr) == 0 then return {} end
  if func(arr[1]) then
    return lisp_remove_if(func, cdr(arr))
  else
    return cons(arr[1], lisp_remove_if(func, cdr(arr)))
  end
end

function lua_remove_if(func, arr)
  local new_array = {}
  for _,v in arr do
    if not func(v) then table.insert(new_array, v) end
  end
  return new_array
end

-- t = lisp_remove_if(function(x) return math.mod(x,2)==0 end, {1,2,3,4,5})
-- print( table.concat(t,",") )