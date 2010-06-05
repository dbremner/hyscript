local t=os.clock()
print(t)

table.foreach(os.date('*t'), print)

table.foreach(os.date('!*t'), print)

print(os.date())

os.execute("echo hello")

local windir=os.getenv("windir")
print(windir)

local tname = os.tmpname()  -- on windows
print(tname)
