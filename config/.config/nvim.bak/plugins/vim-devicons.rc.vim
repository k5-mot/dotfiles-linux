"   U+E287
"   U+F07B
"   U+E601
"   U+E60e
"   U+E769
"   U+E7C4
"   U+f542
let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_enable_denite = 1
let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = "\ue287"
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = "\uf07b"
" overwrite setting for 'vue' to use U+F542
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {
      \ 'fcgi':     "\ue769",
      \ 'perl':     "\ue769",
      \ 'sqlite':   "\ue7c4",
      \ 'tt':       "\ue60e",
      \ 'txt':      "\ue601",
      \ 'vue':      "\uf542",
      \ }
