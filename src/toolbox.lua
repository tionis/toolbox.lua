local json = require("json")
local socket = require "socket"
local colors = require 'ansicolors'

local function isTTY ( fd )
    fd = tonumber( fd ) or 1
    local ok, exit, signal = os.execute( string.format( "test -t %d", fd ) )
    return (ok and exit == "exit") and signal == 0 or false
end

local is_tty = isTTY(1)

-- The map has a bunch of island (consisting of L's for land)
-- in a sea of '.', the island you're currently on is marked with an S on it, the outermost cells are guaranteed to only contain water
-- mark a path around the island that encircles it by only walking the four cardinal directions

local function sleep(sec)
    socket.select(nil, nil, sec)
end


local function slurp(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end
