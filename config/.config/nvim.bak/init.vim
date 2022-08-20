"
" NeoVim Configurations
"   init.vim
"

" Set environment variables.
let $XDG_CACHE_HOME    = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $XDG_CONFIG_HOME   = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $XDG_DATA_HOME     = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME
if has('nvim')
  let $VIM_CACHE_HOME  = $XDG_CACHE_HOME  . '/nvim'
  let $VIM_CONFIG_HOME = $XDG_CONFIG_HOME . '/nvim'
  let $VIM_DATA_HOME   = $XDG_DATA_HOME   . '/nvim'
else
  let $VIM_CACHE_HOME  = $XDG_CACHE_HOME  . '/vim'
  let $VIM_CONFIG_HOME = $XDG_CONFIG_HOME . '/nvim'
  let $VIM_DATA_HOME   = $XDG_DATA_HOME   . '/vim'
endif
let $VIM_PLUGIN_HOME = $VIM_CONFIG_HOME . '/plugins'
let g:swapfile_dir   = $VIM_CACHE_HOME . '/swap'
let g:backup_dir     = $VIM_CACHE_HOME . '/backup'
let g:undo_dir       = $VIM_CACHE_HOME . '/undodir'

if !isdirectory($VIM_CACHE_HOME)
  call mkdir($VIM_CACHE_HOME)
endif
if !isdirectory($VIM_DATA_HOME)
  call mkdir($VIM_DATA_HOME)
endif
if !isdirectory(g:swapfile_dir)
  call mkdir(g:swapfile_dir)
endif
if !isdirectory(g:backup_dir)
  call mkdir(g:backup_dir)
endif
if !isdirectory(g:undo_dir)
  call mkdir(g:undo_dir)
endif

" Set up runtimepath.
set runtimepath+=$VIM_CONFIG_HOME
set runtimepath+=$VIM_PLUGIN_HOME
set runtimepath+=$VIM_DATA_HOME

" Define Keymap Leader <Leader>
let mapleader = ','

" True Color
if has('nvim')
  " For Neovim 0.1.3 and 0.1.4
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  " Or if you have Neovim >= 0.1.5
  if (has("termguicolors"))
    set termguicolors
  endif
elseif !has('gui_running')
  set t_Co=256
endif
set guicursor+=c:ver10

" Base
runtime! ./basis.rc.vim

" Functions
runtime! ./functions.rc.vim

" Keybindings
runtime! ./keybindings.rc.vim

" Plugin Manager
"if (800 <= v:version)
"  runtime! ./dein.vim
"else
  runtime! ./vim-plug.vim
"endif

" Load local settings.
if filereadable(expand('$HOME/.vimrc_local'))
  set runtimepath+=$HOME
  runtime! $HOME/.vimrc_local
endif

augroup Colorcheme
  autocmd Colorscheme * highlight Comment        term=NONE cterm=NONE gui=NONE
  autocmd Colorscheme * highlight SpecialComment term=NONE cterm=NONE gui=NONE
  " highlight Comment term=nocombine cterm=nocombine gui=nocombine
  " highlight SpecialComment term=nocombine cterm=nocombine gui=nocombine
augroup END

set background=dark
colorscheme onehalfdark

