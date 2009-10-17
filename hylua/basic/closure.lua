function makeaddfunc(x)
  -- Return a new function that adds x to the argument
  return function(y)
    -- When we refer to the variable x, which is outside of the current
    -- scope and whose lifetime is shorter than that of this anonymous
    -- function, Lua creates a closure.
    return x + y
  end
end
plustwo = makeaddfunc(2)
print(plustwo(5)) -- Prints 7
