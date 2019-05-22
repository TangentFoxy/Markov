package = "markov"
version = "dev-1"
source = {
   url = "git+ssh://git@github.com/TangentFoxy/Markov.git"
}
description = {
   homepage = "https://github.com/TangentFoxy/Markov",
   license = "MIT license"
}
build = {
   type = "builtin",
   modules = {
      markov = "markov.lua"
   }
}
