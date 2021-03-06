random = love and love.math and love.math.random or math.random
randomseed = love and love.math and love.math.setRandomSeed or math.randomseed

import insert, remove, concat from table

-- used as unique identifiers
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

  -- 1st arg can be a table of options and/or source values, or just an source
  --  additional args are sources
  -- note: if your sources ARE tables, your 1st arg can't be a source!
  new: (...) =>
    opts = select 1, ...
    if "table" != type opts
      opts = { opts } -- make sure 1st source value is still added if the 1st arg isn't a table
    @sep = opts.sep or " "                                   -- separator (string method)
    @max_length = opts.max_length or math.huge               -- max length (string method)
    @replication_allowed = opts.replication_allowed or false -- allow exact replication of sources (string method)

    @pattern = opts.pattern or "%S+" -- default: whitespace delimmits source tokens
    @sources = {}
    @order opts.order or 1

    for i = 1, #opts
      @add opts[i]

    for i = 2, select "#", ...
      @add select i, ...

  -- add a new source
  add: (str, new=true) =>
    insert(@sources, str) if new

    state = State(@_order)
    push = (word) ->
      str = state\concat!
      @data[str] = {} unless @data[str]
      insert(@data[str], word)
      state\push word

    if "string" == type @pattern
      for word in str\gmatch(@pattern)
        push word
    else
      for word in @pattern(str)
        push word
    push END

  -- fetches next token from current state
  next: =>
    next = @data[@state\concat!]
    result = next[random(#next)]
    @state\push result
    return result

  -- generates a chain
  -- options: max_length, sep (separator in generated chain), replication_allowed (can a source be exactly replicated)
  string: (opts={}) =>
    state = @state
    @state = State(@_order)

    result = {}
    for i = 1, opts.max_length or @max_length
      value = @next!
      break if value == END
      insert result, value

    @state = state
    result = concat result, opts.sep or @sep
    unless (opts.replication_allowed or @replication_allowed)
      for str in *@sources
        return @string opts if result == str
    return result

  -- get/set chain order (also known as degree..how many tokens are used in chain generation)
  order: (set) =>
    if set
      @_order = set
      @state = State(@_order)
      @data = { [tostring END]: { START } } -- prevents next method breaking when reaching the end of a chain
      for str in *@sources
        @add str, false
    else
      return @_order
