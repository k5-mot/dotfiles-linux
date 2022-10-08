
vim.g.mapleader = ','
vim.g.localleader = '\\'
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

