function printf(...) io.write(string.format(unpack(arg))) end

local a = Account(100)
printf("Account balance = $%0.02f\n", a:balance() )
a:deposit(50.30)
printf("Account balance = $%0.02f\n", a:balance() )
a:withdraw(25.10)
printf("Account balance = $%0.02f\n", a:balance() )

