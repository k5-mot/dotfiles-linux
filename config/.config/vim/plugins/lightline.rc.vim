" statuslineを常に表示
set laststatus=2
" modeを非表示
set noshowmode

let g:lightline = {
  \   'enable': { 'tabline': 1 },
  \   'colorscheme': 'onedark',
  \   'separator': { 'left': "\ue0b0 ", 'right': " \ue0b2" },
  \   'subseparator' :{ 'left': "\ue0b1 ", 'right': " \ue0b3" },
  \   'active': {
  \     'left': [
  \       ['mode', 'paste'],
  \       ['readonly', 'filename', 'modified'],
  \     ],
  \     'right': [
  \       ['lineinfo'],
  \       ['percent'],
  \       ['fileformat', 'fileencoding', 'filetype']
  \     ],
  \   },
  \   'inactive': {
  \     'left': [
  \       ['filename']
  \     ],
  \     'right': [
  \       ['lineinfo'],
  \       ['percent']
  \     ]
  \   },
  \   'tabline': {
  \     'left': [
  \       ['tabs']
  \     ]
  \   },
  \   'component_expand': {
	\     'percent': "\uf44e %3p%%",
	\     'lineinfo': "\ue0a3 %3l:%-2c",
  \   }
  \ }
