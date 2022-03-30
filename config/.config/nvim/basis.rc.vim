" 編集中でもファイルを開けるように
set hidden

" 他で編集したファイルを自動で再読み込み
set autoread

" 補完時の挙動を指定
"set completeopt=menuone,noselect

" スクロール時の余白行数
set scrolloff=5
set sidescrolloff=6

" バッファスクロール
set mouse=a

" バックアップを作成する
"set backup
" バックアップを作成しない
set nobackup
" backupがOFFの時、バックアップを作成した後削除
"set writebackup
" backupがOFFの時、バックアップを作成しない
set nowritebackup
" バックアップディレクトリの指定
let &backupdir=g:backup_dir
" バックアップファイルの拡張子
set backupext=.backup

" バックスペースでなんでも消せるように
set backspace=indent,eol,start

" テキスト整形オプション
set formatoptions=lmq
autocmd Filetype * setlocal formatoptions-=ro

" ビープ無効
set visualbell t_vb=
set vb t_vb=
if (705 <= v:version)
  set belloff=all
endif

" エラーメッセージ表示時にビープを鳴らさない
set noerrorbells

" 現在のディレクトリから開始
set browsedir=buffer

" カーソルを行をまたいで移動
"set whichwrap=b,s,h,l,<,>,[,],~

" Windowsでパスの区切り文字をスラッシュで扱う
set shellslash

" コマンドをステータスに表示
set showcmd

" 現在のモードを非表示
set noshowmode

" viminfoの設定
if has('nvim')
  set viminfo='1000,f1,<500,:300,@300,/100,!,h,c,n~/.cache/nvim/viminfo
else
  set viminfo='1000,f1,<500,:300,@300,/100,!,h,c,n~/.cache/vim/viminfo
endif
" モードラインを無効
set modelines=0

" タイトルを変更させない
set notitle

" ヤンクでクリップボードを使用
set clipboard=unnamedplus

" コマンドモードで補完を使用
set wildmode=longest:full,full
set wildmenu
set wildignorecase

" スワップファイルを作る
set swapfile
" スワップファイルを作らない
"set noswapfile
" スワップファイルの保存先
let &directory=g:swapfile_dir
" 30秒ごとにスワップファイルを保存
set updatetime=30000
" 500文字ごとにスワップファイルを保存
set updatecount=500

" 折り返さない
set nowrap
" 折り返しを設定したとき、単語内で折り返さない
"set linebreak

" 列幅
"set columns

" 行幅
"set lines

" ルーラーを表示
set ruler

" 省略されずに表示
set display=lastline

" 不可視文字を表示
"set list

" 不可視文字の設定
set listchars=tab:▹\ ,trail:-,extends:»,precedes:«,eol:\ ,nbsp:%

" 開始時の挨拶を表示しない
set shortmess+=I

" 検索ループ時のメッセージを表示しない
set shortmess+=s

" カレント行のハイライト
set cursorline

" 対応する括弧をハイライト表示する
set showmatch

" 括弧のハイライト表示の秒数を設定
set matchtime=3

" インデント方法の変更
set cinoptions+=:0

" メッセージ表示欄を2行確保
"set cmdheight=2
" メッセージ表示欄を1行確保
set cmdheight=1

" ステータス行を常に表示
"set laststatus=2

" コマンドラインの履歴を10000件保存
set history=10000

" 行番号を表示
set number

" 行番号を相対値で表示
"set relativenumber

" スペルチェック(コメントも適用されるので、指定しない)
"set spell

" コマンド実行中は再描画しない
set lazyredraw

" 高速ターミナル接続を行う
set ttyfast

" tabの幅
set tabstop=2

" tabをスペースにする
set expandtab

" Cインデント
"set cindent

" スマートインデント
set smartindent

" オートインデント
"set autoindent

" 全ての数を10進数として扱う
set nrformats=

" キーボードから入力した場合のtabの幅
set softtabstop=2

" 自動で挿入/削除されるインデントの量
set shiftwidth=2

" ツールバーを非表示
set guioptions-=T

" yでコピーしたとき、クリップボードに入る
set guioptions+=ambiwidth

" メニューバーを非表示
set guioptions-=m

" 右スクロールバーを非表示
"set guioptions+=R

" 折りたたみ
set foldmethod=marker
set foldlevel=1
set foldcolumn=0

" 検索にマッチした行以外折りたたむ
set nofoldenable

" 末尾まで検索後、ファイル先頭にループさせる
set wrapscan

" 検索で大文字小文字を区別しない
set ignorecase

" 検索文字に大文字があるときは大文字小文字を区別する
set smartcase

" インクリメンタルサーチ
set incsearch

" 検索文字列をハイライト表示
set hlsearch

set equalalways
"set noequalalways

" concealをOFF
"set conceallevel=0

" vimでjsonを開いた時のconcealをOFF
let g:vim_json_syntax_conceal = 0

" grep
if has('win32')
  set grepprg=jvgrep
endif

" 全角文字専用の設定
set ambiwidth=single
"set ambiwidth=double

" タグファイルを指定
set tags+=.tags,./.tags

" 補完時に1行まるごと補完
set showfulltag

" タグから補完リストに追加
set wildoptions=tagfile

" 文字コード関係
set encoding=utf-8
"set fileencoding=utf-8
"set fileformat=unix
set fileencodings=utf-8,cp932,euc-jp,iso-20220-jp,default,latin,sjis
set fileformats=unix,dos,mac

" アンドゥファイルを生成する
set undofile
" アンドゥファイルを生成しない
"set noundofile
" アンドゥファイルの保存先
let &undodir=g:undo_dir

" vimの矩形選択で文字が無くても右へ進める
set virtualedit=block

" シンタックスハイライト
syntax enable

