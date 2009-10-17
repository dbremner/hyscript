#!/usr/bin/env lua
--
function foo (a)
  print("foo", a)
  return coroutine.yield(2*a)
end

co = coroutine.create(
  function (a,b)
    print("co-body", a, b)
    local r = foo(a+1)
    print("co-body", r)
    local r, s = coroutine.yield(a+b, a-b)
    print("co-body", r, s)
    return b, "end"
  end)

print("main", coroutine.resume(co, 1, 10))
print("main", coroutine.resume(co, "r"))
print("main", coroutine.resume(co, "x", "y"))
print("main", coroutine.resume(co, "x", "y"))


--
function odd(x)
  print('A: odd', x)
  coroutine.yield(x)
  print('B: odd', x)
end

function even(x)
  print('C: even', x)
  if x==2 then return x end
  print('D: even ', x)
end

co = coroutine.create(
  function (x)
    for i=1,x do
      if i==3 then coroutine.yield(-1) end
      if i % 2 == 0 then even(i) else odd(i) end
    end
  end)

count = 1
while coroutine.status(co) ~= 'dead' do
  print('----', count) ; count = count+1
  errorfree, value = coroutine.resume(co, 5)
  print('E: errorfree, value, status', errorfree, value, coroutine.status(co))
end
