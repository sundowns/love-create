local resetColour = "\27[0m"
local errorColour = "\27[31m"
local successColour = "\27[32m"
local emphasisColour = "\27[33m"

local sampleMain = [[
love.filesystem.setRequirePath(love.filesystem.getRequirePath()..";lib/?.lua;lib/;")
DEBUG = false

function love.load()
end

function love.update(dt)
end

function love.draw()
end

function love.keypressed(key)
    if key == "f1" then
        DEBUG = not DEBUG
    elseif key == "escape" then
        love.event.quit()
    elseif key == "space" then
        love.event.quit('restart')
    end
end
]]

local sampleConf = [[
function love.conf(t)
    t.window.title = "New Love Project"
    t.window.width = 1366
    t.window.height = 768
end
]]

function error(text)
    if text == nil then
        print(errorColour)
    else
        print(errorColour.."[ERROR] "..text..resetColour)
    end
end

function success(text)
    print(successColour.."[LOVE-CREATE] "..emphasisColour..text..resetColour)
end

function reset()
    io.write(resetColour)
end

function execute(cmd, successMsg, errorMsg) 
    error()
    if os.execute(cmd) and successMsg then 
        success(successMsg)
    elseif errorMsg then
        error(errorMsg)
    else
        os.exit();
    end
    reset()
end

if arg[1] == nil or arg[1] == '' then
    error("Missing project name parameter. \nTry again with 'love-create <project-name>'")
    os.exit()
end

local directory = arg[1]

success("Generating new LOVE2D project with name: \27[0m\27[1m'".. directory..'\'')

execute("mkdir " .. directory, "Created root directory: "..resetColour..'\''..directory..'\'')
execute("cd "..directory.." && mkdir lib", "Created lib directory", "Failed to create lib directory in ".. directory)
execute("cd "..directory.." && mkdir asset", "Created asset directory", "Failed to create asset directory in ".. directory)
execute("cd "..directory.." && mkdir src", "Created class directory", "Failed to create src directory in ".. directory)
execute("cd "..directory.." && touch main.lua", "Created main.lua", "Failed to create main.lua file in "..directory)
local f = io.open(directory.."/main.lua", "w")
if f then
    f:write(sampleMain)
else
    error("Failed to open newly created main.lua for prepoulation. Does this script have permissions to write here?")
end
execute("cd "..directory.." && touch conf.lua", "Created conf.lua", "Failed to create conf.lua file in "..directory)
local g = io.open(directory.."/conf.lua", "w")
if g then
    g:write(sampleConf)
else
    error("Failed to open newly created main.lua for prepoulation. Does this script have permissions to write here?")
end
