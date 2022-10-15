
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

vim.cmd('colorscheme sonokai')
-- }}}


