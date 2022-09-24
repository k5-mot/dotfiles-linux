let g:deoplete#enable_at_startup =1
let g:deoplete#auto_completion_start_length = 1
inoremap <expr><tab> pumvisible() ? "\<C-n>" :
  \ neosnippet#expandable_or_jumpable() ?
  \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
