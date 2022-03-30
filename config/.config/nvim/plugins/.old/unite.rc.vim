nnoremap [unite] <Nop>
nmap <Leader>u [unite]

" buffer
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>

" file
"nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

" file_rec
"nnoremap <silent> [unite]fr :<C-u>Unite file_rec<CR>

" file_rec/async
nnoremap <silent> [unite]f :<C-u>Unite file_rec/async -buffer-name=file-async<CR>
nnoremap <silent> [unite]vf :<C-u>UniteResume file-async<CR>

" register
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

" file_rec
let g:unite_source_rec_max_cache_files = 20000
let g:unite_source_rec_async_command = [
      \ 'ag', '--follow', '--nocolor', '--nogroup', '--hidden',
      \ '--ignore-dir', 'framework',
      \ '--ignore-dir', 'translate',
      \ '-g', '']

" file_mru
nnoremap <silent> [unite]m :<C-u>Unite neomru/file<CR>

" directory_mru
nnoremap <silent> [unite]d :<C-u>Unite directory_mru<CR>

" yankround
nnoremap <silent> [unite]y :<C-u>Unite yankround<CR>

" grep
nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語からgrep
nnoremap <silent> [unite]cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
" grep検索結果を再呼び出し
nnoremap <silent> [unite]vg :<C-u>UniteResume search-buffer<CR>

" unite-tag
let g:unite_source_tag_max_name_length = 30
let g:unite_source_tag_max_fname_length = 40
nnoremap <silent> [unite]t :<C-u>UniteWithCursorWord -buffer-name=tag tag tag/include<CR>
" t: tags-and-searches
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Jump.
" nnoremap [Tag]t  <C-]>
nnoremap <silent><expr> [Tag]t  &filetype == 'help' ?  "\<C-]>" :
      \ ":\<C-u>UniteWithCursorWord -buffer-name=tag tag tag/include\<CR>"
nnoremap <silent><expr> [Tag]p  &filetype == 'help' ?
      \ ":\<C-u>pop\<CR>" : ":\<C-u>Unite jump\<CR>"

" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_source_grep_encoding = 'utf-8'

"時間のフォーマット
let g:unite_source_buffer_time_format = '(%Y.%m.%d %H:%M:%S) '

" history/yankの有効化
let g:unite_source_history_yank_enable = 1

" grep commands
"if executable('hw')
"  let g:unite_source_grep_command = 'hw'
"  let g:unite_source_grep_default_opts = '--no-group --no-color'
"  let g:unite_source_grep_recursive_opt = ''
if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-S --vimgrep --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
"elseif executable('pt')
"  " Use pt in unite grep source.
"  " https://github.com/monochromegane/the_platinum_searcher
"  let g:unite_source_grep_command = 'pt'
"  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
"  let g:unite_source_grep_recursive_opt = ''
"elseif executable('ack-grep')
"  " Use ack in unite grep source.
"  let g:unite_source_grep_command = 'ack-grep'
"  let g:unite_source_grep_default_opts =
"        \ '-i --no-heading --no-color -k -H'
"  let g:unite_source_grep_recursive_opt = ''
elseif executable('jvgrep')
  " For jvgrep.
  let g:unite_source_grep_command = 'jvgrep'
  let g:unite_source_grep_default_opts =
        \ '-i --exclude ''\.(git|svn|hg|bzr)'''
  let g:unite_source_grep_recursive_opt = '-R'
endif

" unite-grep
let g:unite_source_grep_max_candidates = 10000

"" neomru
let g:neomru#time_format        = '(%Y.%m.%d %H:%M:%S) '
let g:neomru#filename_format    = ':~:.'
let g:neomru#file_mru_limit     = 2000
"let g:neomru#update_interval    = 300

"" unite-quickfix
let g:unite_quickfix_is_multiline = 1
let g:unite_quickfix_filename_is_pathshorten = 0
