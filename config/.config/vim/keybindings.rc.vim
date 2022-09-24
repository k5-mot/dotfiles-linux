" */#をsmartcaseに対応できるように置き換え
nmap * /<C-r><C-w><CR>N
nmap # ?<C-r><C-w><CR>N

" Ctrl + hjkl でウィンドウ間を移動
" My CTRL-H mapping doesn't work
" If you are running Neovim 0.1.7 or older, adjust your terminal's "kbs" terminfo entry:
" infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
" tic $TERM.ti
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><
nnoremap <S-Right> <C-w>>
nnoremap <S-Up>    <C-w>-
nnoremap <S-Down>  <C-w>+

" Escを2回押してハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

" TABにて対応ペアにジャンプ
nmap <Tab> %
vmap <Tab> %

"" コマンドラインモード
" 行頭に移動
cnoremap <C-a> <Home>
" 一文字戻る
cnoremap <C-b> <Left>
" カーソルの下の文字を削除
cnoremap <C-d> <Del>
" 行末へ移動
cnoremap <C-e> <End>
" 一文字進む
cnoremap <C-f> <Right>
" コマンドライン履歴を一つ進む
cnoremap <C-n> <Down>
" コマンドライン履歴を一つ戻る
cnoremap <C-p> <Up>
" 前の単語へ移動
cnoremap <M-b> <S-Left>
" 次の単語へ移動
cnoremap <M-f> <S-Right>

" TABをスペースに変換
nnoremap <Leader>dt :<C-u>retab<CR>
" CRを削除
"nnoremap <Leader>dc :<C-u>%s/<C-v><C-m>//g<CR>
" TAB CR削除
nnoremap <Leader>dc :<C-u>%s/<C-v><C-m>//ge<CR>:noh<CR>:retab<CR>gg

"" タブ操作
nnoremap [tab] <Nop>
nmap t [tab]

" tn 新規タブ
map <silent> [tab]n :tabnew<CR>
" tl 次のタブ
map <silent> [tab]l :tabnext<CR>
" th 前のタブ
map <silent> [tab]h :tabprevious<CR>

" 検索で自動エスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" .vimrcや.gvimrcを編集するためのKey-mappingを定義する
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>

" .vimrcや.gvimrcの変更を反映するためのKey-mappingを定義する
" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
  nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

"" インサートモード
inoremap <C-b> <Up>
inoremap <C-f> <Down>
inoremap <C-p> <Left>
inoremap <C-n> <Right>
