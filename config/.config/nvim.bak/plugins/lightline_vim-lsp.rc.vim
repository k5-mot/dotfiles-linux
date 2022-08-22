" statuslineを常に表示
set laststatus=2
" modeを非表示
set noshowmode

let s:indicator_warnings = "\uf00d "
let s:indicator_errors   = "\uf12a "
let s:indicator_info     = "\uf129 "
let s:indicator_hints    = "\uf128 "
let s:indicator_ok       = "\uf00c "

let g:webdevicons_enable_startify = 1

"highlight LspErrorHighlight       ctermfg=red    guifg=red    term=nocombine cterm=nocombine gui=nocombine
"highlight LspWarningHighlight     ctermfg=yellow guifg=yellow term=nocombine cterm=nocombine gui=nocombine
"highlight LspInformationHighlight ctermfg=blue   guifg=blue   term=nocombine cterm=nocombine gui=nocombine
"highlight LspHintHighlight        ctermfg=green  guifg=green  term=nocombine cterm=nocombine gui=nocombine

"RedSign        xxx ctermfg=167 ctermbg=236 guifg=#ea6962 guibg=#32302f
"YellowSign     xxx ctermfg=214 ctermbg=236 guifg=#d8a657 guibg=#32302f
"BlueSign       xxx ctermfg=109 ctermbg=236 guifg=#7daea3 guibg=#32302f
"AquaSign       xxx ctermfg=108 ctermbg=236 guifg=#89b482 guibg=#32302f
"highlight LspDiagnosticsSignError       ctermfg=167 guifg=#ea6962 term=nocombine cterm=nocombine gui=nocombine
"highlight LspDiagnosticsSignWarning     ctermfg=214 guifg=#d8a657 term=nocombine cterm=nocombine gui=nocombine
"highlight LspDiagnosticsSignInformation ctermfg=109 guifg=#7daea3 term=nocombine cterm=nocombine gui=nocombine
"highlight LspDiagnosticsSignHint        ctermfg=108 guifg=#89b482 term=nocombine cterm=nocombine gui=nocombine


function! LightlineLSPErrors() abort
  let l:counts = lsp#get_buffer_diagnostics_counts()
  return l:counts.error == 0 ? '' : printf(s:indicator_errors . '%d', l:counts.error)
endfunction

function! LightlineLSPWarnings() abort
  let l:counts = lsp#get_buffer_diagnostics_counts()
  return l:counts.warning == 0 ? '' : printf(s:indicator_warnings . '%d', l:counts.warning)
endfunction

function! LightlineLSPInfomations() abort
  let l:counts = lsp#get_buffer_diagnostics_counts()
  return l:counts.information == 0 ? '' : printf(s:indicator_info . '%d', l:counts.information)
endfunction

function! LightlineLSPHints() abort
  let l:counts = lsp#get_buffer_diagnostics_counts()
  return l:counts.hint == 0 ? '' : printf(s:indicator_hints . '%d', l:counts.hint)
endfunction

function! LightlineLSPOk() abort
  let l:counts =  lsp#get_buffer_diagnostics_counts()
  let l:total = l:counts.error + l:counts.warning + l:counts.information + l:counts.hint
  return l:total == 0 ? s:indicator_ok : ''
endfunction

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "\uf067"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "\ue0a2"
  else
    return ""
  endif
endfunction

function! LightlineFilename()
  "return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
  "      \ ('' != expand('%:t') ? WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t') : '[No Name]') .
  "      \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
  return ('' != expand('%:t') ? WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t') : '[No Name]')
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? (WebDevIconsGetFileFormatSymbol() . ' ' . &fileformat) : ''
endfunction

function! LightlineLogo()
  return "\ue7c5"
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return winwidth(0) > 60 ? "\ue7c5 " . lightline#mode() : ''
endfunction

function! LightlineTabFileicon(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction

augroup LightlineAutocmd
  autocmd!
  autocmd User lsp_diagnostics_updated call lightline#update()
augroup END

function! s:onColorSchemeChange()
    "" " Try a scheme provided already
    ""execute 'runtime autoload/lightline/colorscheme/'.a:scheme.'.vim'
    ""if exists('g:lightline#colorscheme#{a:scheme}#palette')
    ""    let g:lightline.colorscheme = a:scheme
    ""else  " Try falling back to a known colour scheme
    ""    let l:colors_name = get(s:colour_scheme_map, a:scheme, '')
    ""    if empty(l:colors_name)
    ""        return
    ""    else
    ""        let g:lightline.colorscheme = l:colors_name
    ""    endif
    ""endif
    let g:lightline.colorscheme = g:colors_name
    call lightline#disable()
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
    call lightline#enable()
endfunction

augroup ABC
  autocmd!
  autocmd Colorscheme * call s:onColorSchemeChange()
augroup END

let g:lightline = {
  \   'enable': { 'tabline': 1 },
  \   'colorscheme': 'gruvbox_material',
  \   'separator': { 'left': "\ue0b0 ", 'right': " \ue0b2" },
  \   'subseparator': { 'left': "\ue0b1 ", 'right': " \ue0b3" },
  \   'mode_map': {
  \
  \   },
  \   'active': {
  \     'left': [
  \       ['mode', 'paste'],
  \       ['readonly', 'filename', 'modified'],
  \     ],
  \     'right': [
  \       ['lineinfo'],
  \       ['percent'],
  \       ['fileformat', 'fileencoding', 'filetype'],
  \       ['lsp_errors', 'lsp_warnings', 'lsp_ok'],
  \     ],
  \   },
  \   'tabline': {
  \     'left': [
  \       ['tabs']
  \     ],
  \     'right': [
  \       ['close']
  \     ],
  \   },
  \   'tab': {
  \     'active': ['tabnum', 'filename', 'fileicon', 'modified'],
  \     'inactive': ['tabnum', 'filename'],
  \   },
  \   'component': {
  \     'percent': "\uf44e %3p%%",
  \     'lineinfo': "\ue0a1 %l \ue0a3 %c",
  \     'fileencoding': "\uf672 " . '%{&fenc!=#""?&fenc:&enc}',
  \   },
  \   'component_function': {
  \     'readonly':   'LightlineReadonly',
  \     'modified':   'LightlineModified',
  \     'filename':   'LightlineFilename',
  \     'filetype':   'LightlineFiletype',
  \     'fileformat': 'LightlineFileformat',
  \     'mode':       'LightlineMode',
  \   },
  \   'component_expand': {
  \     'lsp_warnings': 'LightlineLSPWarnings',
  \     'lsp_errors':   'LightlineLSPErrors',
  \     'lsp_info':     'LightlineLSPInfomations',
  \     'lsp_hints':    'LightlineLSPHints',
  \     'lsp_ok':       'LightlineLSPOk',
  \   },
  \   'tab_component_function': {
  \     'fileicon': 'LightlineTabFileicon',
  \   },
  \   'component_type': {
  \     'lsp_warnings': 'warning',
  \     'lsp_errors':   'error',
  \     'lsp_info':     'info',
  \     'lsp_hints':    'hint',
  \     'lsp_ok':       'left',
  \   },
  \ }


