-- save the used globals
local math, require, setmetatable, pcall =
      math, require, setmetatable, pcall

-- create the Event module
--module "hello"

--local messagebox = require "helloc"
--local sayhello = require "helloc"

function sayHi(s)
    require "helloc"
    helloc.messagebox(s)
    helloc.sayhello(s)
    --messagebox(s)
    local newtable = helloc.newtable()

    print(newtable)

    for k, v in pairs(newtable) do
        print(k, v)
        if type(v) == "table" then
            for k2, v2 in pairs(v) do
                print("¨C", k2, v2)
            end
        end
    end
end
