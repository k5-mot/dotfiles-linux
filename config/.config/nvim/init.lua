-- [[ init.lua ]]

require('base')
require('keymaps')
require('plugins')

local has = vim.fn.has
local is_win = has('win16') or has('win32') or has('win64')
local is_mac = has('mac')   or has('macunix')

if is_win == 1 then
    require('env.win')
elseif is_mac == 1 then
    require('env.mac')
else
    require('env.linux')
end

