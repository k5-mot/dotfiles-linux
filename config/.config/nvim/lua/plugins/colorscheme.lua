
-- ColorScheme {{{

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

autocmd("ColorScheme", {pattern = "*", command = "highlight Normal         ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight NonText        ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight LineNr         ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight Folded         ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight EndOfBuffer    ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight Comment        ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight SpecialComment ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight FoldColumn     ctermbg=NONE guibg=none"})
autocmd("ColorScheme", {pattern = "*", command = "highlight NormalNC       ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight Constant       ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight Special        ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight Identifier     ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight Statement      ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight PreProc        ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight Type           ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight Underlined     ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight Todo           ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight String         ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight Function       ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight Conditional    ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight Repeat         ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight Operator       ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight Structure      ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight SignColumn     ctermbg=NONE guibg=NONE"})
autocmd("ColorScheme", {pattern = "*", command = "highlight CursorLineNr   ctermbg=NONE guibg=NONE"})

-- Diagnostics
vim.fn.sign_define('DiagnosticSignError', {text = ' ', texthl = 'DiagnosticSignError', numhl = 'DiagnosticSignError'})
vim.fn.sign_define('DiagnosticSignWarn',  {text = ' ', texthl = 'DiagnosticSignWarn',  numhl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignHint',  {text = ' ', texthl = 'DiagnosticSignHint',  numhl = 'DiagnosticSignHint' })
vim.fn.sign_define('DiagnosticSignInfo',  {text = ' ', texthl = 'DiagnosticSignInfo',  numhl = 'DiagnosticSignInfo' })

require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = false },
    keywords = { italic = false },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})

vim.cmd('colorscheme sonokai')
-- }}}


