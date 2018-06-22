random = love and love.math and love.math.random or math.random
randomseed = love and love.math and love.math.setRandomSeed or math.randomseed

import insert, remove, concat from table

START = {}
END = {}

class State
  new: (@length=1) =>
    insert(@, START)
  push: (value) =>
    insert(@, value)
    remove(@, 1) if #@ > @length
  concat: =>
    -- concat(@, " ")
    result = tostring @[1]
    for i = 2, #@
      result ..= tostring @[i]
    return result

class Markov
  @seed: (value) -> randomseed value
  @START: START
  @END: END

  new: (...) =>
    opts = select 1, ...
    opts = { opts } if "string" == type opts

    @pattern = opts.pattern or "%S+"
    @sources = {}
    @order opts.order or 1

    for i = 1, #opts
      @add opts[i]

    for i = 2, select "#", ...
      @add select i, ...

  add: (str, new=true) =>
    insert(@sources, str) if new

    state = State(@_order)
    push = (word) ->
      str = state\concat!
      @data[str] = {} unless @data[str]
      insert(@data[str], word)
      state\push word

    for word in str\gmatch(@pattern)
      push word
    push END

  next: =>
    next = @data[@state\concat!]
    result = next[random(#next)]
    @state\push result
    return result

  string: (opts={}) =>
    state = @state
    @state = State(@_order)
    opts.sep = " " unless opts.sep
    opts.max_length = math.huge unless opts.max_length

    result = {}
    for i = 1, opts.max_length
      value = @next!
      break if value == END
      insert result, value

    @state = state
    return concat result, opts.sep

  order: (set) =>
    if set
      @_order = set
      @state = State(@_order)
      @data = { [tostring END]: { START } }
      for str in *@sources
        @add str, false
    else
      return @_order
