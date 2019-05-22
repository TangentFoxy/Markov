package = "markov"
version = "dev-1"
source = {
   url = "git+ssh://git@github.com/Guard13007/Markov.git"
}
description = {
   homepage = "https://github.com/Guard13007/Markov",
   license = "MIT license"
}
build = {
   type = "builtin",
   modules = {
      markov = "markov.lua"
   }
}
