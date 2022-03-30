"" options
let s:defx_win_width_percent = 0.85
let s:defx_win_height_percent = 0.7
"call defx#custom#option('_', {
"      \ 'split': 'floating',
"      \ 'toggle': v:true,
"      \ 'winwidth': float2nr(&columns * s:defx_win_width_percent),
"      \ 'wincol': float2nr((&columns - (&columns * s:defx_win_width_percent)) / 2),
"      \ 'winheight': float2nr(&lines * s:defx_win_height_percent),
"      \ 'winrow': float2nr((&lines - (&lines * s:defx_win_height_percent)) / 2),
"      \ 'show_ignored_files': v:true,
"      \ 'columns': 'mark:indent:git:icons:filename:type',
"      \ })
"call defx#custom#column('mark', {
"      \ 'readonly_icon': "\ue0a2",
"      \ 'selected_icon': "\uf00c",
"      \ })

" keymap
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " file open
  nnoremap <silent><buffer><expr> <CR> defx#is_directory() ? defx#do_action('open') : defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> vs   defx#is_directory() ? defx#do_action('open') : defx#do_action('multi', [['drop', 'vsplit'], 'quit']
  nnoremap <silent><buffer><expr> s    defx#is_directory() ? defx#do_action('open') : defx#do_action('multi', [['drop', 'split'], 'quit'])
  nnoremap <silent><buffer><expr> P    defx#do_action('open', 'pedit')
  " file operation
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> d defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  " tree operation
  nnoremap <silent><buffer><expr> h       defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> j       line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k       line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> l       defx#is_directory() ? defx#do_action('open') : defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> t       defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> T       defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> C       defx#do_action('toggle_columns', 'mark:indent:git:icons:filename:type:size:time')
  nnoremap <silent><buffer><expr> S       defx#do_action('toggle_sort',    'time')
  nnoremap <silent><buffer><expr> !       defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x       defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy      defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .       defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;       defx#do_action('repeat')
  nnoremap <silent><buffer><expr> ~       defx#do_action('cd')
  nnoremap <silent><buffer><expr> q       defx#do_action('quit')
  nnoremap <silent><buffer><expr> <C-g>   defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select').'j'
  nnoremap <silent><buffer><expr> *       defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> <C-l>   defx#do_action('redraw')
  "nnoremap <silent><buffer><expr> <C-g>   defx#do_action('print')
  nnoremap <silent><buffer><expr> cd      defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer>       <C-n>   j
  nnoremap <silent><buffer>       <C-p>   k
endfunction
