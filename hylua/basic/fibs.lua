fibs = { 1, 1 }                                -- Initial values for fibs[1] and fibs[2].
setmetatable(fibs, {                           -- Give fibs some magic behavior.
  __index = function(name, n)                  -- Call this function if fibs[n] does not exist.
    name[n] = name[n - 1] + name[n - 2]        -- Calculate and memoize fibs[n].
    return name[n]
  end
})

print(fibs[3]);