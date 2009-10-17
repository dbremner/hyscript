--
function factorial(n)
  if n == 0 then
    return 1
  else
    return n * factorial(n - 1)
  end
end

--
function factorial2(n)
  return n == 0 and 1 or n * factorial2(n - 1)
end


print(factorial(3));
print(factorial2(3));
