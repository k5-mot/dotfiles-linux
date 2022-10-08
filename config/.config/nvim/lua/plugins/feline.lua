-- [[ plugins/feline.lua ]]

local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')
local gps = require("nvim-gps")





require('feline').setup({
  theme = gruvbox,
--  default_bg = bg,
--  default_fg = fg,
--  vi_mode_colors = vi_mode_colors,
--  components = components,
--  force_inactive = force_inactive,
})

--require('feline').winbar.setup({
--  components = winbar_components,
--  force_inactive = force_inactive,
--})
