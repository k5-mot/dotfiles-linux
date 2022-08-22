let g:gitgutter_sign_added            = '✚ '
let g:gitgutter_sign_modified         = '➜ '
let g:gitgutter_sign_removed          = '✘ '
let g:gitgutter_sign_modified_removed = '↪ '

nnoremap <silent> <Leader>gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> <Leader>gh :<C-u>GitGutterLineHighlightsToggle<CR>
