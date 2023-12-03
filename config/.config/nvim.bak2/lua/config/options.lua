-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ","
vim.opt.termguicolors = true
vim.opt.winblend = 20 -- ウィンドウの不透明度
vim.opt.pumblend = 0 -- ポップアップメニューの不透明度

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

autocmd("ColorScheme", { pattern = "*", command = "highlight Normal         ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight NonText        ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight LineNr         ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight Folded         ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight EndOfBuffer    ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight Comment        ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight SpecialComment ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight FoldColumn     ctermbg=NONE guibg=none" })
autocmd("ColorScheme", { pattern = "*", command = "highlight NormalNC       ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight Constant       ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight Special        ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight Identifier     ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight Statement      ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight PreProc        ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight Type           ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight Underlined     ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight Todo           ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight String         ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight Function       ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight Conditional    ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight Repeat         ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight Operator       ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight Structure      ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight SignColumn     ctermbg=NONE guibg=NONE" })
autocmd("ColorScheme", { pattern = "*", command = "highlight CursorLineNr   ctermbg=NONE guibg=NONE" })
