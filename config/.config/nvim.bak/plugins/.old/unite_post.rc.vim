" neomru
" プロジェクトごとに出し分ける
call unite#custom#source(
      \ 'neomru/file,file_mru', 'matchers',
      \ ['matcher_project_files', 'matcher_default'])

" 表示変更
"call unite#custom#source(
"      \ 'file_mru', 'matchers',
"      \ ['matcher_file_name', 'sorter_default', 'converter_file_directory'])

" unite-tag wordにファイルパスを追加
let s:filters = {
      \   "name" : "converter_add_filepath_word",
      \}
function! s:filters.filter(candidates, context)
  let candidates = copy(a:candidates)
  let max = 0
  for candidate in candidates
    let abbr = split(candidate.abbr, '')
    let candidate.word = candidate.word . abbr[1]
  endfor
  return candidates
endfunction
call unite#define_filter(s:filters)
unlet s:filters
call unite#custom#source('tag', 'matchers', ['converter_add_filepath_word', 'matcher_default'])

function! s:UniteMapping()
  " C-gで閉じる
  imap <buffer><C-g> <Plug>(unite_exit)
  " マークを変更
  "nmap <silent> <buffer> J <Plug>(unite_toggle_mark_current_candidate)
  "nmap <silent> <buffer> K <Plug>(unite_toggle_mark_current_candidate_up)
endfunction

function! s:VimFilerMapping()
  " マークを変更
  "nmap <buffer> J <Plug>(vimfiler_toggle_mark_current_line)
  "nmap <buffer> K <Plug>(vimfiler_toggle_mark_current_line_up)
  nmap <buffer> vv <Plug>(vimfiler_toggle_mark_all_lines)
  nmap <buffer> vu <Plug>(vimfiler_clear_mark_all_lines)
endfunction

augroup mapping
  autocmd!
  autocmd FileType unite call s:UniteMapping()
  autocmd FileType vimfiler call s:VimFilerMapping()
augroup END
