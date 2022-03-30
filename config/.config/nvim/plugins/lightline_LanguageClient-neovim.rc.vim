""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline for LanguageClient-Neovim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:lightline.component_expand = {
"    \   'linter_errors': 'lightline#languageclient#errors',
"    \   'linter_ok': 'lightline#languageclient#ok',
"    \ }
"
"let g:lightline.component_type = {
"    \   'linter_errors': 'error',
"    \   'linter_ok': 'left',
"    \ }
"
"let g:lightline#languageclient#indicator_ok = "\uf00c "
"let g:lightline#languageclient#indicator_lt = "Linting"
"let g:lightline#languageclient#indicator_fd = "Failed"
"let g:lightline#languageclient#indicator_e = "\uf05e :%d"
"let g:lightline#languageclient#indicator_w = "\uf071 :%d"
"let g:lightline#languageclient#indicator_i = "I:%d"

"function! LSPStatus() abort
"  let l:errors = 0
"  let l:warnings = 0
"  for item in getqflist()
"      if item["type"] == "E"
"          let l:errors += 1
"      else
"          let l:warnings += 1
"      endif
"  endfor
"
"  if l:errors + l:warnings == 0
"    return "\uf00c "
"  else
"    return "\uf05e " . l:errors . " " . "\uf071" . l:warnings
"  endif
"endfunction

