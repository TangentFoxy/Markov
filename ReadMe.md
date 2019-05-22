# Markov

Creates Markov chain generators of any order/degree with any source(s). Uses Lua
patterns or a custom function to specify how to tokenize source(s).

## Usage

```
local markov = require "markov"
local generator = markov(opts_or_sources, ...)
```

The first argument can be an array of sources, and/or a table with the following
options:

- `pattern` Lua pattern or iterator function to tokenize sources
- `order` (also known as degree) How many tokens are used in chain generation
- `sep` A separator to use in chain generation (string method)
- `max_length` Maximum length used in chain generation (string method)
- `replication_allowed` Are exact source replicas allowed to be generated
  (string method)

Any additional arguments are sources.

Methods:

- `generator:add(str)` Adds a new source to an existing Markov chain generator
- `generator:string(opts)` Generates a chain, `opts` overrides the options for
  this method listed above (sep, max_length, and replication_allowed)
- `generator:order(x)` Get/Set the order/degree of the generator
- `generator:next()` Fetches the next token (used internally to generate chains)

`markov.START` and `markov.END` are empty tables used as unique identifies to
indicate where a chain should start or end. This is documented should you wish
to use the `next` method, or manually use of start and end points somehow.

## Examples

(More examples are in the `test.moon`/`test.lua` files.)

```lua
local markov = require "markov"
-- Generate a new element name
local elements = { "Hydrogen", "Helium", "Lithium", ... }
local element_generator = markov({pattern = "%a", order = 2}, unpack(elements))
print(element_generator:string()) -- Frassium, Erbon, Seadold, Lanium, ...
-- Generate a new paragraph of lorem ipsum:
print(markov(lorem_ipsum_text):string())
-- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
-- okay that example isn't very good
```
