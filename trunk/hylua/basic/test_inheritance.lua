SimpleClass = {}
SimpleClass_mt = { __index = SimpleClass }

-- This function creates a new instance of SimpleClass
--
function SimpleClass:create()
    local new_inst = {}    -- the new instance
    setmetatable( new_inst, SimpleClass_mt ) -- all instances share the same metatable
    return new_inst
end

-- Here are some functions (methods) for SimpleClass:

function SimpleClass:className()
    print( "SimpleClass" )
end

function SimpleClass:doSomething()
    print( "Doing something" )
end

-- Create a new class that inherits from a base class
function inheritsFrom( baseClass )
    -- The following lines are equivalent to the SimpleClass example:
    -- Create the table and metatable representing the class.
    local new_class = {}
    local class_mt = { __index = new_class }

    -- Note that this function uses class_mt as an upvalue, so every instance
    -- of the class will share the same metatable.
    function new_class:create()
        local newinst = {}
        setmetatable( newinst, class_mt )
        return newinst
    end

    -- The following is the key to implementing inheritance:

    -- The __index member of the new class's metatable references the
    -- base class.  This implies that all methods of the base class will
    -- be exposed to the sub-class, and that the sub-class can override
    -- any of these methods.
    if baseClass then
        setmetatable( new_class, { __index = baseClass } )
    end

    -- Implementation of additional OO properties starts here --

    -- Return the class object of the instance
    function new_class:class()
        return new_class
    end

    -- Return the super class object of the instance
    function new_class:superClass()
        return baseClass
    end

    -- Return true if the caller is an instance of theClass
    function new_class:isa( theClass )
        local b_isa = false

        local cur_class = new_class

        while ( nil ~= cur_class ) and ( false == b_isa ) do
            if cur_class == theClass then
                b_isa = true
            else
                cur_class = cur_class:superClass()
            end
        end

        return b_isa
    end
    
    return new_class
end

-- Create a new class that inherits from SimpleClass
SubClass = inheritsFrom( SimpleClass )

-- override className() function
function SubClass:className() print( "SubClass" ) end

------------------------------------------------------------------------------
-- Create an instance of SimpleClass
simple = SimpleClass:create()
simple:className()
simple:doSomething()

-- Create an instance of SubClass
sub = SubClass:create()
sub:className()  -- Call overridden method
sub:doSomething()  -- Call base class method

SimpleClass = inheritsFrom( nil )  -- pass nil because SimpleClass has no super class
SubClass = inheritsFrom( SimpleClass )
FinalClass = inheritsFrom( SubClass )
sub = SubClass:create()
fc = FinalClass:create()
print( fc:isa( SubClass ) )
print( fc:isa( FinalClass ) )
print( sub:isa( SubClass ) )
print( sub:isa( FinalClass ) )
------------------------------------------------------------------------------

function clone( base_object, clone_object )
  if type( base_object ) ~= "table" then
    return clone_object or base_object 
  end
  clone_object = clone_object or {}
  clone_object.__index = base_object
  return setmetatable(clone_object, clone_object)
end

function isa( clone_object, base_object )
  local clone_object_type = type(clone_object)
  local base_object_type = type(base_object)
  if clone_object_type ~= "table" and base_object_type ~= table then
    return clone_object_type == base_object_type
  end
  local index = clone_object.__index
  local _isa = index == base_object
  while not _isa and index ~= nil do
    index = index.__index
    _isa = index == base_object
  end
  return _isa
end


object = clone( table, { clone = clone, isa = isa } )

-- testing "isa"
foo = object:clone()
bar = object:clone()
baz = foo:clone()

print( foo:isa(object) )
print( bar:isa(foo) )
print( baz:isa(foo) )

--[[ output:
true
false
true
]]

--testing prototype delegation

foo = object:clone()
bar = foo:clone()

function foo:speak()
  print(self.thoughts or "foo has no thoughts")
end

bar:speak()

--[[ output:
foo has no thoughts
]]

bar.thoughts = "I may be a clone, but I'm an individual!"
bar:speak()

--[[ output:
I may be a clone, but I'm an individual!
]]


