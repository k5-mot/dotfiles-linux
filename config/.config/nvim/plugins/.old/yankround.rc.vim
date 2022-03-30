nnoremap <silent> [unite]y :<C-u>Unite yankround<CR>

nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-next)
nmap <C-n> <Plug>(yankround-prev)

let g:yankround_max_history = 50
