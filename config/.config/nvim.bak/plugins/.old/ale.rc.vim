let g:ale_sign_column_always = 1

let b:ale_linters = {
    \   'javascript': ['eslint', 'eslint-plugin-vue'],
    \   'python': ['pyls','pyflakes', 'pep8'],
    \   'ruby': ['rubocop'],
    \   'tex': ['textlint'],
    \   'markdown': ['textlint'],
    \   'css': ['stylelint'],
    \   'rust': ['rls'],
    \}

let g:ale_sign_warning = "\uf071"
let g:ale_sign_error = "\uf05e"
"let g:ale_sign_warning = "!!"
"let g:ale_sign_error = "=="
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'

let g:ale_echo_msg_format = '[%linter%] %code: %%s [%severity%]'
let g:ale_open_list = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 1

" Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
