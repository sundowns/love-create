# love-create

A script to generate a new LOVE2D project, including a main.lua file with empty call-back functions.

----------------------------

## Installation

* Install Lua and ensure it is correctly referenced in the PATH variable.
* Add the following to `~/.bash_profile` (replace <PATH_TO_THIS_FOLDER> with the correct path):

```shell
love-create() {
    if [ -z "$1" ]
    then
        echo "No argument supplied"
    else
        command lua.exe <PATH_TO_THIS_FOLDER>/love-create.lua $1
    fi
}
```

Note: <PATH_TO_THIS_FOLDER> can be ommitted if the directory containing `love-create.lua` is a part of the PATH variable.

----------------------------

## Usage

```shell
love-create my-new-project
```

Constructs a directory named **'my-new-project'** with the following contents:

```shell
- lib/
- asset/
- class/
- main.lua
- conf.lua
```

The generated `main.lua` file's contents can be overriden by modifying `love-create.lua`. By default it is as below:

```lua
love.filesystem.setRequirePath(love.filesystem.getRequirePath()..";lib/?.lua;lib/;")
debug = false

function love.load()
end

function love.update(dt)
end

function love.draw()
end

function love.keypressed(key)
    if key == "f1" then
        debug = not debug
    end
end
```