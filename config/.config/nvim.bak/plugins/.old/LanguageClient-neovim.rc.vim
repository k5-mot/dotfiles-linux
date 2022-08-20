set hidden

let g:LanguageClient_serverCommands = {}

" 言語ごとに設定する
"if executable('clangd')
"    let g:LanguageClient_serverCommands['c'] = ['clangd']
"    let g:LanguageClient_serverCommands['cpp'] = ['clangd']
"endif
"
"if executable('pyls')
"    let g:LanguageClient_serverCommands['python'] = ['pyls']
"endif

let g:LanguageClient_serverCommands = {
  \ 'c': ['clangd', '-compile-commands-dir=' . getcwd() . '/build'],
  \ 'cpp': ['clangd', '-compile-commands-dir=' . getcwd() . '/build'],
  \ }

augroup LanguageClient_config
  autocmd!
  autocmd User LanguageClientStarted setlocal signcolumn=yes
  autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

let g:lsp_diagnostics_echo_cursor = 1
let g:LanguageClient_autoStart = 1

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_hasSnippetSupport = 0

set completefunc=LanguageClient#complete

nnoremap <Leader>lh :call LanguageClient_textDocument_hover()<CR>
nnoremap <Leader>ld :call LanguageClient_textDocument_definition()<CR>
nnoremap <Leader>lr :call LanguageClient_textDocument_rename()<CR>
nnoremap <Leader>lf :call LanguageClient_textDocument_formatting()<CR>
