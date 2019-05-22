local random = love and love.math and love.math.random or math.random
local randomseed = love and love.math and love.math.setRandomSeed or math.randomseed
local insert, remove, concat
do
  local _obj_0 = table
  insert, remove, concat = _obj_0.insert, _obj_0.remove, _obj_0.concat
end
local START = { }
local END = { }
local State
do
  local _class_0
  local _base_0 = {
    push = function(self, value)
      insert(self, value)
      if #self > self.length then
        return remove(self, 1)
      end
    end,
    concat = function(self)
      local result = tostring(self[1])
      for i = 2, #self do
        result = result .. tostring(self[i])
      end
      return result
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, length)
      if length == nil then
        length = 1
      end
      self.length = length
      return insert(self, START)
    end,
    __base = _base_0,
    __name = "State"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  State = _class_0
end
local Markov
do
  local _class_0
  local _base_0 = {
    add = function(self, str, new)
      if new == nil then
        new = true
      end
      if new then
        insert(self.sources, str)
      end
      local state = State(self._order)
      local push
      push = function(word)
        str = state:concat()
        if not (self.data[str]) then
          self.data[str] = { }
        end
        insert(self.data[str], word)
        return state:push(word)
      end
      if "string" == type(self.pattern) then
        for word in str:gmatch(self.pattern) do
          push(word)
        end
      else
        for word in self:pattern(str) do
          push(word)
        end
      end
      return push(END)
    end,
    next = function(self)
      local next = self.data[self.state:concat()]
      local result = next[random(#next)]
      self.state:push(result)
      return result
    end,
    string = function(self, opts)
      if opts == nil then
        opts = { }
      end
      local state = self.state
      self.state = State(self._order)
      local result = { }
      for i = 1, opts.max_length or self.max_length do
        local value = self:next()
        if value == END then
          break
        end
        insert(result, value)
      end
      self.state = state
      result = concat(result, opts.sep or self.sep)
      if not ((opts.replication_allowed or self.replication_allowed)) then
        local _list_0 = self.sources
        for _index_0 = 1, #_list_0 do
          local str = _list_0[_index_0]
          if result == str then
            return self:string(opts)
          end
        end
      end
      return result
    end,
    order = function(self, set)
      if set then
        self._order = set
        self.state = State(self._order)
        self.data = {
          [tostring(END)] = {
            START
          }
        }
        local _list_0 = self.sources
        for _index_0 = 1, #_list_0 do
          local str = _list_0[_index_0]
          self:add(str, false)
        end
      else
        return self._order
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, ...)
      local opts = select(1, ...)
      if "table" ~= type(opts) then
        opts = {
          opts
        }
      end
      self.sep = opts.sep or " "
      self.max_length = opts.max_length or math.huge
      self.replication_allowed = opts.replication_allowed or false
      self.pattern = opts.pattern or "%S+"
      self.sources = { }
      self:order(opts.order or 1)
      for i = 1, #opts do
        self:add(opts[i])
      end
      for i = 2, select("#", ...) do
        self:add(select(i, ...))
      end
    end,
    __base = _base_0,
    __name = "Markov"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  local self = _class_0
  self.seed = function(value)
    return randomseed(value)
  end
  self.START = START
  self.END = END
  Markov = _class_0
  return _class_0
end
