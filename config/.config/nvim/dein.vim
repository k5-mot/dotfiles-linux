if &compatible
  set nocompatible " Be iMproved
endif

" Reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" Set up location of coc-settings.json
let g:coc_config_home = '$HOME/.config/nvim'

" Required:
" Add the dein installation directory into runtimepath
let s:dein_cache_home = $VIM_CACHE_HOME . '/dein'
let s:dein_repos_home= s:dein_cache_home . '/repos/github.com/Shougo/dein.vim'
set runtimepath+=s:dein_repos_dir

" Install dein.vim
if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:dein_repos_home)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repos_home
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_repos_home, ':p')
endif

if dein#load_state(s:dein_cache_home)
  " Required:
  call dein#begin(s:dein_cache_home)

  " Let dein manage dein
  "call dein#add({path to dein.vim directory})
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Add plugins.
  let s:init_plugin_list = '$HOME/.config/nvim/dein_init.toml'
  let s:lazy_plugin_list = '$HOME/.config/nvim/dein_lazy.toml'
  let s:file_plugin_list = '$HOME/.config/nvim/dein_filetype.toml'
  call dein#load_toml(s:init_plugin_list, {'lazy' : 0})
  call dein#load_toml(s:lazy_plugin_list, {'lazy' : 1})
  call dein#load_toml(s:file_plugin_list, {'lazy' : 1})

  " Required:
  call dein#end()

  " Generate cache for plugins.
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

" If you want to remove installed plugins on startup.
"let s:removed_plugins = dein#check_clean()
"if len(s:removed_plugins) > 0
"  call map(s:removed_plugins, "delete(v:val, 'rf')")
"  call dein#recache_runtimepath()
"endif




