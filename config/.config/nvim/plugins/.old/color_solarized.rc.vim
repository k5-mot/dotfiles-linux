au MyAutoCmd VimEnter * nested colorscheme solarized
colorscheme solarized

"let g:lightline_color = 'solarized'

" カラースキームをダークテーマに
set background=dark

" gitgutter solarized colors
highlight clear SignColumn
highlight DiffAdd term=bold ctermbg=1 gui=bold guifg=#2aa198 guibg=#073642 guisp=#859900
highlight link GitGutterAdd DiffAdd
highlight link GitGutterChange DiffChange
highlight link GitGutterDelete DiffDelete
highlight link GitGutterChangeDelete DiffDelete
