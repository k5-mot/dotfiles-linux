
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline for coc.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global Configs
let g:nerdfont = 1
let g:lightline#coc#indicator_warnings = "\uf00d"
let g:lightline#coc#indicator_errors   = "\uf12a"
let g:lightline#coc#indicator_info     = "\uf129"
let g:lightline#coc#indicator_hints    = "\uf128"
let g:lightline#coc#indicator_ok       = "\uf00c"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configs
let s:nerdfont = get(g:, 'nerdfont', 0)
let s:indicator_warnings = get(g:, 'lightline#coc#indicator_warnings', (s:nerdfont ? "\uf00d" : '!'))
let s:indicator_errors   = get(g:, 'lightline#coc#indicator_errors',   (s:nerdfont ? "\uf12a" : '×'))
let s:indicator_info     = get(g:, 'lightline#coc#indicator_info',     (s:nerdfont ? "\uf129" : 'i'))
let s:indicator_hints    = get(g:, 'lightline#coc#indicator_hints',    (s:nerdfont ? "\uf128" : '?'))
let s:indicator_ok       = get(g:, 'lightline#coc#indicator_ok',       (s:nerdfont ? "\uf00c" : '✓'))

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline components
function! Coc_warnings() abort
  if s:isHidden()
    return ''
  endif

  let l:counts = s:count('warning')
  return l:counts == 0 ? '' : printf(s:indicator_warnings . '%d', l:counts)
  "return printf(s:indicator_warnings . '%d', l:counts)
endfunction

function! Coc_errors() abort
  if s:isHidden()
    return ''
  endif

  let l:counts = s:count('error')
  return l:counts == 0 ? '' : printf(s:indicator_errors . '%d', l:counts)
  "return printf(s:indicator_errors . '%d', l:counts)
endfunction

function! Coc_info() abort
  if s:isHidden()
    return ''
  endif

  let l:counts = s:count('information')
  return l:counts == 0 ? '' : printf(s:indicator_info . '%d', l:counts)
  "return printf(s:indicator_info . '%d', l:counts)
endfunction

function! Coc_hints() abort
  if s:isHidden()
    return ''
  endif

  let l:counts = s:count('hint')
  return l:counts == 0 ? '' : printf(s:indicator_hints . '%d', l:counts)
  "return printf(s:indicator_hints . '%d', l:counts)
endfunction

function! Coc_ok() abort
  if s:isHidden()
    return ''
  endif

  let l:counts = s:countSum()
  return l:counts == 0 ? s:indicator_ok : ''
  "return printf(s:indicator_ok . '%d', l:counts)
endfunction

function! Coc_status()
  return get(g:, 'coc_status', '')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
function! s:count(level) abort
  let info = get(b:, 'coc_diagnostic_info', {})
  return get(info, a:level, 0)
endfunction

function! s:countSum() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  return get(info, 'error', 0) + get(info, 'warning', 0) + get(info, 'information', 0) + get(info, 'hint', 0)
endfunction

function! s:isHidden()
  return exists('*lightline#sensible#isHidden') && lightline#sensible#isHidden()
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Register Lightline
let g:lightline = {
  \   'enable': { 'tabline': 1 },
  \   'separator': { 'left': "\ue0b0 ", 'right': " \ue0b2" },
  \   'subseparator' :{ 'left': "\ue0b1 ", 'right': " \ue0b3" },
	\   'component_expand': {
	\     'coc_status'   : 'Coc_status',
  \     'coc_warnings' : 'Coc_warnings',
  \     'coc_errors'   : 'Coc_errors',
  \     'coc_info'     : 'Coc_info',
  \     'coc_hints'    : 'Coc_hints',
  \     'coc_ok'       : 'Coc_ok',
	\   },
  \   'component_type' : {
  \     'coc_warnings' : 'warning',
  \     'coc_errors'   : 'error',
  \     'coc_info'     : 'info',
  \     'coc_hints'    : 'hint',
  \     'coc_ok'       : 'left',
  \   },
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
  \ }

" Update coc status.
augroup lightline#coc
  autocmd!
  autocmd User CocDiagnosticChange call lightline#update()
  autocmd User CocStatusChange call lightline#update()
augroup END
