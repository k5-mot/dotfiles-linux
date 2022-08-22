nnoremap [vim-over] <Nop>
nmap <Leader>m [vim-over]

" over.vimの起動
nnoremap <silent> [vim-over]s :OverCommandLine<CR>

" カーソル下の単語をハイライト付きで置換
nnoremap <silent> [vim-over]c :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" コピーした文字列をハイライト付きで置換
"nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
