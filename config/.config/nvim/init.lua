-- [[ init.lua ]]


vim.cmd("autocmd!")
vim.g.mapleader = ','
vim.g.localleader = '\\'

local cache_dir = os.getenv('HOME') .. '/.cache/nvim/'
-- local is_windows = has('win16') || has('win32') || has('win64')
-- local is_mac = has('mac')

-- Character code
vim.scriptencoding    = 'utf-8'
vim.opt.encoding      = 'utf-8'
vim.opt.fileencoding  = 'utf-8'
-- vim.opt.fileencodings = 'iso-2022-jp,ucs-bom,sjis,utf-8,euc-jp,cp932,default,latin1'
vim.opt.fileencodings = 'ucs-bom,utf-8,iso-2022-jp,cp932,euc-jp,default,latin'
vim.opt.fileformat    = 'unix'
vim.opt.fileformats   = 'unix,mac,dos'
vim.opt.ambiwidth     = 'single'

-- Terminal
vim.opt.termguicolors = true
vim.opt.title         = true

-- Number
vim.opt.number      = true
-- vim.opt.colorcolumn = '100'
vim.opt.signcolumn  = 'number'

-- Fold 
vim.opt.foldenable = true
vim.opt.foldmethod = 'marker'
-- vim.opt.foldmethod = { 'indent', 'marker' }
vim.opt.foldlevel  = 2
vim.opt.foldcolumn = '3'

-- Invisible characters
vim.opt.list = true
vim.opt.listchars:append('tab:|‣')
vim.opt.listchars:append('trail:␣')
vim.opt.listchars:append('extends:»')
vim.opt.listchars:append('precedes:«')
vim.opt.listchars:append('nbsp:␣')
vim.opt.listchars:append('eol:¶')

-- Visual mode
vim.opt.virtualedit = 'block'

-- Buffer
vim.opt.hidden = true

-- Backspace
vim.opt.backspace = 'indent,eol,start'

-- Bell
vim.opt.errorbells = false
vim.opt.visualbell = true

-- Indent
vim.opt.smartindent = true
-- vim.opt.autoindent  = true
vim.opt.shiftround  = true
vim.opt.breakindent = true
vim.opt.breakindentopt = 'min:20,shift:2'

-- TAB to SPACE
vim.opt.smarttab    = true
vim.opt.shiftwidth  = 4
vim.opt.tabstop     = 4
vim.opt.softtabstop = -1

-- Statusline, Commandline
vim.opt.laststatus = 3
vim.opt.showcmd    = false
vim.opt.showmode   = false

vim.opt.cmdheight=1


-- Search
vim.opt.incsearch  = true
vim.opt.hlsearch   = true
vim.opt.ignorecase = true
vim.opt.smartcase  = true
vim.opt.wrapscan   = true
vim.opt.ignorecase = true

-- Backup (*~)
vim.opt.backup      = true
vim.opt.backupdir   = cache_dir .. 'backup/'
vim.opt.writebackup = true
-- vim.opt.backupext   = '.back'

-- Swapfile (*.swap)
vim.opt.swapfile    = true
vim.opt.directory   = cache_dir .. 'swap/'
vim.opt.updatetime  = 30000
vim.opt.updatecount = 500

-- Undofile (*.undo)
vim.opt.undofile    = true
vim.opt.undodir     = cache_dir .. 'undo/'

-- Viewfile (*.view)
--vim.opt.viewdir     = cache_dir .. 'view/'
--vim.opt.viewoptions = 'folds,cursor,curdir,slash,unix'

-- History
vim.opt.history = 5000

-- Mouse control (Normal, Visual, Insert)
vim.opt.mouse = 'nvi'

function Exists(file)
    local ok, err, code = os.rename(file, file)
    if not ok then
       if code == 13 then
          -- Permission denied, but it exists
          return true
       end
    end
    return ok, err
 end
function IsDir(path)
    -- "/" works on both Unix and Windows
    return Exists(path.."/")
end

if not IsDir("~/.local/share/nvim/site/pack/packer/start/packer.nvim") then
    os.execute("git clone --verbose --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim")
end

require'plugins'

-- vim.cmd[[autocmd BufWritePost plugins.lua PackerCompile]]
vim.cmd([[
  augroup PackerReload
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerInstall
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd([[
"augroup FoldState
"	autocmd!
"	autocmd BufWinLeave * mkview
"	autocmd BufWinEnter * silent loadview
"augroup end
]])
vim.cmd([[
]])

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

vim.cmd('colorscheme tokyonight')
