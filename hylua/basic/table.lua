#!/usr/bin/env lua

-- table.lua
-- !!! Tables are always passed by reference
--
-- Creates a new table, with one associated entry. The string x mapping to
-- the number 10.
a_table = {x = 10}
-- Prints the value associated with the string key,
-- in this case 10.
print(a_table["x"])
b_table = a_table
b_table["x"] = 20    -- The value in the table has been changed to 20.
print(a_table["x"])  -- Prints 20.
-- Prints 20, because a_table and b_table both refer to the same table.
print(b_table["x"])

-- As structure
point = { x = 10, y = 20 }   -- Create new table
print(point["x"])            -- Prints 10
print(point.x)               -- Has exactly the same meaning as line above

-- As namespace
Point = {}
Point.new = function (x, y)
  return {x = x, y = y}
end
 
Point.set_x = function (point, x)
  point.x = x
end

-- As array
array = { "a", "b", "c", "d" }   -- Indices are assigned automatically.
print(array[2])                  -- Prints "b". Automatic indexing in Lua starts at 1.
print(#array)                    -- Prints 4.  # is the length operator for tables and strings.
array[0] = "z"                   -- Zero is a legal index.
print(#array)                    -- Still prints 4, as Lua arrays are 1-based.

function Point(x, y)        -- "Point" object constructor
  return { x = x, y = y }   -- Creates and returns a new object (table)
end
array = { Point(10, 20), Point(30, 40), Point(50, 60) }   -- Creates array of points
print(array[2].y)

