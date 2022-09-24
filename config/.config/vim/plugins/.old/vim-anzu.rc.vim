" 検索時にヒットした行を画面中央に表示 折りたたみを展開
nmap n <Plug>(anzu-n)zzzv
nmap N <Plug>(anzu-N)zzzv

let g:anzu_bottomtop_word = '( ˘ω˘)ｳｪ'
let g:anzu_topbottom_word = '( ˘ω˘)ｼﾀ'
let g:anzu_status_format = '%p[%i/%l] %w'

augroup vim-anzu
  " 一定時間キー入力がないとき、ウインドウを移動したとき、タブを移動したときに
  " 検索ヒット数の表示を消去する
  autocmd!
  autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
augroup END
