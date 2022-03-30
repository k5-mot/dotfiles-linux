" 現在のファイルパスをコピー
command! CopyPath
      \ let @*=expand('%') | echo 'copied'

" Transparent Background
augroup AutoColorscheme
  autocmd!
  autocmd Colorscheme * highlight Normal ctermbg=NONE guibg=NONE
  autocmd Colorscheme * highlight NonText ctermbg=NONE guibg=NONE
  autocmd Colorscheme * highlight LineNr ctermbg=NONE guibg=NONE
  autocmd Colorscheme * highlight Folded ctermbg=NONE guibg=NONE
  autocmd Colorscheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE
augroup END

" jsonを整形
command! JsonFormat :execute '%!python -m json.tool'
      \ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)).encode(\"utf-8\"), sys.stdin.read()))"'
      \ | :set ft=json
      \ | :1

" 保存時に行末スペースを削除
augroup saveFile
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
augroup END

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" .mdファイルをModula2形式ではなく、Markdown形式で開く。
autocmd BufNewFile,BufRead *.md set filetype=markdown

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line ("'\"") <= line("$") |
          \   exe "normal! g'\"" |
          \ endif
  augroup END
endif

