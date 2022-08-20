" options
let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7
call denite#custom#option('default', {
      \ 'split': 'floating',
      \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
      \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
      \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
      \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
      \ 'highlight_filter_background': 'DeniteFilter',
      \ 'highlight_matched_char': 'Underlined',
      \ 'prompt': '$ ',
      \ })


" key mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer>       <C-n>   j
  nnoremap <silent><buffer>       <C-p>   k
  nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d       denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p       denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q       denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-g>   denite#do_map('quit')
  nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> <Tab>   denite#do_map('choose_action')
  nnoremap <silent><buffer><expr> <C-l>   denite#do_map('redraw')
  nnoremap <silent><buffer><expr> <BS>    denite#do_map('move_up_path')

  " disable window moving
  nnoremap <silent><buffer><expr> <C-h> denite#do_map('nop')
  nnoremap <silent><buffer><expr> <C-j> denite#do_map('nop')
  nnoremap <silent><buffer><expr> <C-k> denite#do_map('nop')
  "nnoremap <silent><buffer><expr> <C-l> denite#do_map('nop')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_setting()
function! s:denite_filter_my_setting() abort
  imap <silent><buffer>           <C-g> <Plug>(denite_filter_quit)
  nmap <silent><buffer>           <C-g> <Plug>(denite_filter_quit)
  inoremap <silent><buffer>       <C-n> <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
  inoremap <silent><buffer>       <C-p> <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
endfunction

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
      \ ['-i', '--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Use fd for finding files
if executable('fd')
  call denite#custom#var('file/rec', 'command',
        \ ['fd', '--follow', '--hidden', '--exclude', '.git', '.*'])
else
  call denite#custom#var('file/rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
endif

" neomru
" プロジェクトごとに出し分ける
call denite#custom#source(
      \ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])

"
"" 表示変更
""call unite#custom#source(
""      \ 'file_mru', 'matchers',
""      \ ['matcher_file_name', 'sorter_default', 'converter_file_directory'])
"

"function! s:UniteMapping()
"  " C-gで閉じる
"  imap <buffer><C-g> <Plug>(unite_exit)
"  imap <buffer><C-g> <Plug>(unite_exit)
"  " マークを変更
"  "nmap <silent> <buffer> J <Plug>(unite_toggle_mark_current_candidate)
"  "nmap <silent> <buffer> K <Plug>(unite_toggle_mark_current_candidate_up)
"endfunction
"
"augroup mapping
"  autocmd!
"  autocmd FileType unite call s:UniteMapping()
"  autocmd FileType vimfiler call s:VimFilerMapping()
"augroup END

