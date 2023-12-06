package = "toolbox.lua"
version = "dev-1"
source = {
   url = "https://github.com/tionis/toolbox.lua"
}
description = {
   homepage = "https://github.com/tionis/toolbox.lua",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1, <= 5.4",
   "json",
   "luasocket",
   "ansicolors"
}
build = {
   type = "builtin",
   modules = {
      toolbox = "src/toolbox.lua",
   }
}
