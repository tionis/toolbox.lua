local socket = require "socket"

local function isTTY ( fd )
    fd = tonumber( fd ) or 1
    local ok, exit, signal = os.execute( string.format( "test -t %d", fd ) )
    return (ok and exit == "exit") and signal == 0 or false
end

local function sleep(sec)
    socket.select(nil, nil, sec)
end

local function slurp(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end

return {
    sleep = sleep,
    slurp = slurp,
    isTTY = isTTY
}
