" ○や□の文字が崩れる問題を回避
"set ambiwidth=double

" タブを有効にする
let g:airline#extensions#tabline#enabled = 1
" タブを切り替える
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
" タブに番号を表示する
let g:airline#extensions#tabline#buffer_idx_mode = 1
" 番号のフォーマットを変更
let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '
	\}
" タブの区切りを変更
"let g:airline#extensions#tabline#left_sep = '\'
"let g:airline#extensions#tabline#left_alt_sep = '/'
" 各モードで表示される文字の変更
let g:airline_mode_map = {
	\ 'n'  : 'Normal',
	\ 'i'  : 'Insert',
	\ 'R'  : 'Replace',
	\ 'c'  : 'Command',
	\ 'v'  : 'Visual',
	\ 'V'  : 'V-Line',
	\ '' : 'V-Block',
	\ }

" ステータスラインに表示する項目を変更する
"let g:airline#extensions#default#layout = [
"	\ [ 'z', 'y', 'x' ],
"	\ [ 'c', 'b', 'a', 'error', 'warning']
"	\ ]
"let g:airline_section_a = airline#section#create(['mode', 'crypt'])

" テーマを変更する
"let g:airline_theme = 'papercolor'
let g:airline_theme = 'wombat'
"let g:airline_theme = 'solarized'
" 挿入モードからノーマルモードへの切り替えの遅延をなくす
set ttimeoutlen=50

" Powerline系フォントを利用する
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#whitespace#mixed_indent_algo = 1

" （タブが一個の場合）バッファのリストをタブラインに表示する機能をオフ
"let g:airline#extensions#tabline#show_buffers = 0
" 0でそのタブで開いてるウィンドウ数、1で左のタブから連番
let g:airline#extensions#tabline#tab_nr_type = 1
" タブに表示する名前（fnamemodifyの第二引数）
let g:airline#extensions#tabline#fnamemod = ':t'

" gitのHEADから変更した行の+-を非表示(vim-gitgutterの拡張)
"let g:airline#extensions#hunks#enabled = 0

let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'

"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#wordcount#enabled = 0
"let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z', 'error', 'warning']]
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
"let g:airline_section_c = '%t'
"let g:airline_section_x = '%{&filetype}'
"let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
"let g:airline_section_a = airline#section#create(['mode'])
"let g:airline_section_b = airline#section#create(['branch'])
let g:airline_section_c = airline#section#create(['%t'])
"let g:airline_section_x = airline#section#create(['filetype'])
"let g:airline_section_y = airline#section#create(['fileencoding'])
"let g:airline_section_z = airline#section#create(['%{airline#extensions#ale#get_warning()}','%{airline#extensions#ale#get_error()}','%3p%%', '%l:%v'])
"let g:airline_section_z = airline#section#create(['windowswap','%{airline#extensions#ale#get_warning()}','%{airline#extensions#ale#get_error()}','%l:%v (%p%%)'])
let g:airline_section_z = airline#section#create(['windowswap','%l:%v (%p%%)'])
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

" old vim-powerline symbols
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'




""左側に使用されるセパレータ
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
""右側に使用されるセパレータ
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.crypt = '🔒'		"暗号化されたファイル
"let g:airline_symbols.linenr = '¶'			"行
"let g:airline_symbols.maxlinenr = '㏑'		"最大行
"let g:airline_symbols.branch = '⭠'		"gitブランチ
"let g:airline_symbols.paste = 'ρ'			"ペーストモード
"let g:airline_symbols.spell = 'Ꞩ'			"スペルチェック
"let g:airline_symbols.notexists = '∄'		"gitで管理されていない場合
"let g:airline_symbols.whitespace = 'Ξ'	"空白の警告(余分な空白など)
"
"let g:airline_theme = 'wombat'
"set laststatus=2
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#wordcount#enabled = 0
"let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
"let g:airline_section_c = '%t'
"let g:airline_section_x = '%{&filetype}'
""let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
"let g:airline#extensions#ale#error_symbol = ' '
"let g:airline#extensions#ale#warning_symbol = ' '
"let g:airline#extensions#default#section_truncate_width = {}
"let g:airline#extensions#whitespace#enabled = 1

" Powerline系フォントを利用する
"set laststatus=2
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#whitespace#mixed_indent_algo = 1
"let g:airline_theme = 'papercolor'

"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = '☰'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

" old vim-powerline symbols
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'
