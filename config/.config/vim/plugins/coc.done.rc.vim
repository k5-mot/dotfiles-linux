let g:lightline = {
  \   'enable': { 'tabline': 1 },
  \   'colorscheme': g:lightline_color,
  \   'separator': { 'left': "\ue0b0 ", 'right': " \ue0b2" },
  \   'subseparator' :{ 'left': "\ue0b1 ", 'right': " \ue0b3" },
  \   'active': {
  \     'left': [
  \       ['mode', 'paste'],
  \       ['readonly', 'filename', 'modified'],
  \       ['coc_errors', 'coc_warnings', 'coc_info', 'coc_hints', 'coc_ok' ],
  \       ['coc_status']
  \     ],
  \     'right': [
  \       ['lineinfo'],
  \       ['percent'],
  \       ['fileformat', 'fileencoding', 'filetype']
  \     ],
  \   },
  \   'inactive': {
  \     'left': [
  \       ['filename']
  \     ],
  \     'right': [
  \       ['lineinfo'],
  \       ['percent']
  \     ]
  \   },
	\   'component_function': {
	\     'coc_status' : 'coc#status'
	\   },
  \   'component_expand' : {
  \     'coc_status'   : 'lightline#coc#status',
  \     'coc_warnings' : 'lightline#coc#warnings',
  \     'coc_errors'   : 'lightline#coc#errors',
  \     'coc_info'     : 'lightline#coc#info',
  \     'coc_hints'    : 'lightline#coc#hints',
  \     'coc_ok'       : 'lightline#coc#ok',
  \   },
  \   'component_type' : {
  \     'coc_warnings' : 'warning',
  \     'coc_errors'   : 'error',
  \     'coc_info'     : 'info',
  \     'coc_hints'    : 'hint',
  \     'coc_ok'       : 'left',
  \   },
  \ }

" register compoments:
call lightline#coc#register()




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Configs
"
"let s:nerdfont = get(g:, 'nerdfont', 0)
"
"let s:indicator_warnings = get(g:, 'lightline#coc#indicator_warnings', '•')
"let s:indicator_errors = get(g:, 'lightline#coc#indicator_errors', '×')
"let s:indicator_info = get(g:, 'lightline#coc#indicator_info', '~')
"let s:indicator_hints = get(g:, 'lightline#coc#indicator_hints', '>')
"let s:indicator_ok = get(g:, 'lightline#coc#indicator_ok', (s:nerdfont ? "\uf058" : '✓'))
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Lightline components
"
"function! lightline#coc#warnings() abort
"  if s:isHidden()
"    return ''
"  endif
"
"  let l:counts = s:count('warning')
"  return l:counts == 0 ? '' : printf(s:indicator_warnings . '%d', l:counts)
"endfunction
"
"function! lightline#coc#errors() abort
"  if s:isHidden()
"    return ''
"  endif
"
"  let l:counts = s:count('error')
"  return l:counts == 0 ? '' : printf(s:indicator_errors . '%d', l:counts)
"endfunction
"
"function! lightline#coc#info() abort
"  if s:isHidden()
"    return ''
"  endif
"
"  let l:counts = s:count('information')
"  return l:counts == 0 ? '' : printf(s:indicator_info . '%d', l:counts)
"endfunction
"
"function! lightline#coc#hints() abort
"  if s:isHidden()
"    return ''
"  endif
"
"  let l:counts = s:count('hint')
"  return l:counts == 0 ? '' : printf(s:indicator_hints . '%d', l:counts)
"endfunction
"
"function! lightline#coc#ok() abort
"  if s:isHidden()
"    return ''
"  endif
"
"  let l:counts = s:countSum()
"  return l:counts == 0 ? s:indicator_ok : ''
"endfunction
"
"function! lightline#coc#status()
"  return get(g:, 'coc_status', '')
"endfunction
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Helper functions
"
"function! s:count(level) abort
"  let info = get(b:, 'coc_diagnostic_info', {})
"  return get(info, a:level, 0)
"endfunction
"
"function! s:countSum() abort
"  let info = get(b:, 'coc_diagnostic_info', {})
"  return get(info, 'error', 0) + get(info, 'warning', 0)
"endfunction
"
"function! s:isHidden()
"  return exists('*lightline#sensible#isHidden') && lightline#sensible#isHidden()
"endfunction
"
"function! s:setLightline(scope, name, value) abort
"  let g:lightline = get(g:, 'lightline', {})
"  let g:lightline[a:scope] = get(g:lightline, a:scope, {})
"  let g:lightline[a:scope][a:name] =  get(g:lightline[a:scope], a:name, a:value)
"endfunction
"
"
""let g:lightline_color = "default"
"let g:lightline = {
"  \   'enable': { 'tabline': 1 },
"  \   'colorscheme': g:lightline_color,
"  \   'separator': { 'left': "\ue0b0 ", 'right': " \ue0b2" },
"  \   'subseparator' :{ 'left': "\ue0b1 ", 'right': " \ue0b3" },
"  \   'active': {
"  \     'left': [
"  \       ['mode', 'paste'],
"  \       ['readonly', 'filename', 'modified'],
"  \       ['coc_errors', 'coc_warnings', 'coc_info', 'coc_hints', 'coc_ok' ],
"  \       ['coc_status']
"  \     ],
"  \     'right': [
"  \       ['lineinfo'],
"  \       ['percent'],
"  \       ['fileformat', 'fileencoding', 'filetype']
"  \     ],
"  \   },
"  \   'inactive': {
"  \     'left': [
"  \       ['filename']
"  \     ],
"  \     'right': [
"  \       ['lineinfo'],
"  \       ['percent']
"  \     ]
"  \   },
"	\   'component_function': {
"	\     'coc_status' : 'coc#status'
"	\   },
"  \   'component_expand' : {
"  \     'coc_status'   : 'lightline#coc#status',
"  \     'coc_warnings' : 'lightline#coc#warnings',
"  \     'coc_errors'   : 'lightline#coc#errors',
"  \     'coc_info'     : 'lightline#coc#info',
"  \     'coc_hints'    : 'lightline#coc#hints',
"  \     'coc_ok'       : 'lightline#coc#ok',
"  \   },
"  \   'component_type' : {
"  \     'coc_warnings' : 'warning',
"  \     'coc_errors'   : 'error',
"  \     'coc_info'     : 'info',
"  \     'coc_hints'    : 'hint',
"  \     'coc_ok'       : 'left',
"  \   },
"  \ }
"
""let g:lightline = {
""\ 'colorscheme': g:lightline_color,
""\ 'active': {
""\   'left': [ [ 'mode', 'paste' ],
""\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
""\ },
""\ 'component_function': {
""\   'cocstatus': 'coc#status'
""\ },
""\ }
"
"" Use autocmd to force lightline update.
"autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
