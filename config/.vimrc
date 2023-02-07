" Load configuration for NeoVim.
" source ~/.config/vim/init.vim
"source ~/.vimrc.bak


" Environment
let $XDG_CACHE_HOME  = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $XDG_CONFIG_HOME = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $XDG_DATA_HOME   = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME
let $VIM_CACHE_HOME  = $XDG_CACHE_HOME  . '/vim'
let $VIM_CONFIG_HOME = $XDG_CONFIG_HOME . '/vim'
let $VIM_DATA_HOME   = $XDG_DATA_HOME   . '/vim'
let $VIM_PLUGIN_HOME = $VIM_CONFIG_HOME . '/plugins'
let g:swapfile_dir   = $VIM_CACHE_HOME  . '/swap'
let g:backup_dir     = $VIM_CACHE_HOME  . '/backup'
let g:undo_dir       = $VIM_CACHE_HOME  . '/undodir'

set runtimepath+=$VIM_CONFIG_HOME
set runtimepath+=$VIM_PLUGIN_HOME
set runtimepath+=$VIM_DATA_HOME

" Define Keymap Leader <Leader>
let mapleader = ','

" set termguicolors
set term=xterm-256color
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" " 文字色
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" " 背景色]


set t_Co=256
set guicursor+=c:ver10

" Base
source $VIM_CONFIG_HOME/basis.rc.vim

" Functions
source $VIM_CONFIG_HOME/functions.rc.vim

" Keybindings
source $VIM_CONFIG_HOME/keybindings.rc.vim

" Plugin Manager
"if (800 <= v:version)
"  runtime! $VIM_CONFIG_HOME . ./dein.vim
"else
  source $VIM_CONFIG_HOME/vim-plug.vim
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

