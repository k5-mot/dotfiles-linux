

-- colorscheme -----------------------------------------------------------------
vim.cmd('autocmd ColorScheme * highlight Normal         ctermbg=none guibg=none')
vim.cmd('autocmd ColorScheme * highlight NonText        ctermbg=none guibg=none')
vim.cmd('autocmd ColorScheme * highlight LineNr         ctermbg=none guibg=none')
vim.cmd('autocmd ColorScheme * highlight Folded         ctermbg=none guibg=none')
vim.cmd('autocmd ColorScheme * highlight EndOfBuffer    ctermbg=none guibg=none')
vim.cmd('autocmd Colorscheme * highlight Comment        term=NONE cterm=NONE gui=NONE')
vim.cmd('autocmd Colorscheme * highlight SpecialComment term=NONE cterm=NONE gui=NONE')

vim.cmd('autocmd ColorScheme * highlight FoldColumn       ctermbg=none guibg=none')
vim.cmd('autocmd Colorscheme * highlight NormalNC ctermbg=none guibg=NONE')
vim.cmd('autocmd Colorscheme * highlight Constant ctermbg=none guibg=NONE')
vim.cmd('autocmd Colorscheme * highlight Special ctermbg=none guibg=NONE')
vim.cmd('autocmd Colorscheme * highlight Identifier ctermbg=none guibg=NONE')
vim.cmd('autocmd Colorscheme * highlight Statement ctermbg=none guibg=NONE')
vim.cmd('autocmd Colorscheme * highlight PreProc ctermbg=none guibg=NONE')
vim.cmd('autocmd Colorscheme * highlight Type ctermbg=none guibg=NONE')
vim.cmd('autocmd Colorscheme * highlight Underlined ctermbg=none guibg=NONE')
vim.cmd('autocmd Colorscheme * highlight Todo         ctermbg=none guibg=NONE')
vim.cmd('autocmd Colorscheme * highlight String       ctermbg=none guibg=NONE')
vim.cmd('autocmd Colorscheme * highlight Function     ctermbg=none guibg=NONE')
vim.cmd('autocmd Colorscheme * highlight Conditional  ctermbg=none guibg=NONE')
vim.cmd('autocmd Colorscheme * highlight Repeat       ctermbg=none guibg=NONE')
vim.cmd('autocmd Colorscheme * highlight Operator     ctermbg=none guibg=NONE')
vim.cmd('autocmd Colorscheme * highlight Structure    ctermbg=none guibg=NONE')
vim.cmd('autocmd Colorscheme * highlight SignColumn   ctermbg=none guibg=NONE')
vim.cmd('autocmd Colorscheme * highlight CursorLineNr ctermbg=none guibg=NONE')





-- Diagnostics 
vim.fn.sign_define('DiagnosticSignError', {text = ' ', texthl = 'DiagnosticSignError', numhl = 'DiagnosticSignError'})
vim.fn.sign_define('DiagnosticSignWarn',  {text = ' ', texthl = 'DiagnosticSignWarn',  numhl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignHint',  {text = ' ', texthl = 'DiagnosticSignHint',  numhl = 'DiagnosticSignHint' })
vim.fn.sign_define('DiagnosticSignInfo',  {text = ' ', texthl = 'DiagnosticSignInfo',  numhl = 'DiagnosticSignInfo' })
-- }}}


vim.cmd('colorscheme sonokai')

