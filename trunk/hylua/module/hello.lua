-- save the used globals
local math, require, setmetatable, pcall =
      math, require, setmetatable, pcall

-- create the Event module
module "hello"

local messagebox = require "helloc"

function sayHi(s)
    messagebox(s)
end
