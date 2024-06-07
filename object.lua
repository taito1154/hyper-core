-- Inspired from SNKRX
-- https://github.com/a327ex/SNKRX/blob/6b93a64d694d59472375467648868ae4521d6706/engine/game/object.lua

Object = {}
Object.__index = Object


function Object:init()
end


-- Returns a table where the table has "__" keys populated and the metatable is set to the parent object.
function Object:extend()
  local cls = {}
  for k, v in pairs(self) do
    if k:find("__") == 1 then
      cls[k] = v
    end
  end
  cls.__index = cls
  cls.super = self
  setmetatable(cls, self)
  return cls
end


function Object:implement(...)
  for _, cls in pairs({...}) do
    for k, v in pairs(cls) do
      if self[k] == nil and type(v) == "function" then
        self[k] = v
      end
    end
  end
end


function Object:is(T)
  local mt = getmetatable(self)
  while mt do
    if mt == T then
      return true
    end
    mt = getmetatable(mt)
  end
  return false
end


function Object:__tostring()
  return "Object"
end


function Object:__call(...)
  local obj = setmetatable({}, self)
  obj:init(...)
  return obj
end