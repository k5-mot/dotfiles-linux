let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
let plug_file = data_dir . '/autoload/plug.vim'

" Install vim-plug if not found
if empty(glob(plug_file))
  silent execute '!curl -fLo ' . plug_file .
    \ ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Specify a directory for plugins
call plug#begin(data_dir . '/plugged')
  " color scheme
  Plug 'morhetz/gruvbox'
  Plug 'croaker/mustang-vim'
  Plug 'nanotech/jellybeans.vim'
  Plug 'tomasr/molokai'
  Plug 'dracula/vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'cocopon/iceberg.vim'
  Plug 'joshdick/onedark.vim'
  Plug 'sonph/onehalf'
  Plug 'jacoborus/tender.vim'
  Plug 'junegunn/seoul256.vim'
  Plug 'morhetz/gruvbox'
  Plug 'sainnhe/gruvbox-material'
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'folke/tokyonight.nvim'
  " Plug 'ghifarit53/tokyonight-vim'

  " syntax highlight
  Plug 'sheerun/vim-polyglot'

  " status line
  Plug 'itchyny/lightline.vim'

  " status line for tmux
  Plug 'edkolev/tmuxline.vim'

  " IDE
  if has('python3')
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
  endif
  if (800 <= v:version || has('nvim')) && has('timers')
    Plug 'prabirshrestha/asyncomplete.vim'
    if has('lua') || (has('nvim') && has('nvim-0.4'))
      Plug 'prabirshrestha/vim-lsp'
      Plug 'prabirshrestha/asyncomplete-lsp.vim'
      Plug 'mattn/vim-lsp-settings'
      " Plug 'mattn/vim-lsp-icons'
    endif
    if has('python3')
      Plug 'thomasfaingnaert/vim-lsp-snippets'
      Plug 'thomasfaingnaert/vim-lsp-ultisnips'
    endif
  endif

  " filer
  if has('python3')
    if has('nvim') && has('nvim-0.4')
      Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
      Plug 'kristijanhusak/defx-icons'
      Plug 'kristijanhusak/defx-git'
    elseif !has('nvim') && 800 <= v:version
      Plug 'Shougo/defx.nvim'
      Plug 'kristijanhusak/defx-icons'
      Plug 'kristijanhusak/defx-git'
    endif
  endif

  " icons
  Plug 'ryanoasis/vim-devicons'

  " Git
  Plug 'airblade/vim-gitgutter'

  " filetype
  Plug 'lervag/vimtex', { 'for': ['tex'] }
  " Plug 'vhda/verilog_systemverilog.vim'
  Plug 'cespare/vim-toml', { 'for': ['toml'] }
  Plug 'sophacles/vim-processing'

  Plug 'jiangmiao/auto-pairs'
  Plug 'godlygeek/tabular'
  Plug 'preservim/vim-markdown'

  " for Vim
  if !has('nvim')
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

  " game
  " Plug 'vim-scripts/TeTrIs.vim'
  " Plug 'PsychoLlama/vim-gol', { 'on': 'GOL' }
  " Plug 'mattn/invader-vim'
  " Plug 'johngrib/vim-game-snake'
call plug#end()

" Check the specified plugin is installed
function s:is_plugged(name)
  if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
    return 1
  else
    return 0
  endif
endfunction

" Plugin configurtation
if s:is_plugged("lightline.vim")
  runtime! ./plugins/lightline.rc.vim
endif
if s:is_plugged("asyncomplete.vim")
  runtime! ./plugins/asyncomplete.rc.vim
endif
if s:is_plugged("vim-lsp")
  runtime! ./plugins/vim-lsp.rc.vim
endif
if s:is_plugged("tmuxline.vim")
  runtime! ./plugins/tmuxline.rc.vim
endif
if s:is_plugged("vim-lsp-ultisnips")
  runtime! ./plugins/vim-lsp-ultisnips.rc.vim
endif
if s:is_plugged("defx.nvim")
  runtime! ./plugins/defx.nvim.rc.vim
endif

if s:is_plugged("lightline.vim") && s:is_plugged("vim-lsp")
  runtime! ./plugins/lightline_vim-lsp.rc.vim
endif
