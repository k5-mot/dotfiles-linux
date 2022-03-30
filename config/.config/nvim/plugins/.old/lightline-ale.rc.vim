let g:lightline.component_expand = {
      \'linter_checking': 'lightline#ale#checking',
      \'linter_warnings': 'lightline#ale#warnings',
      \'linter_errors': 'lightline#ale#errors',
      \'linter_ok': 'lightline#ale#ok',
      \}

let g:lightline.component_type = {
      \'linter_checking': 'left',
      \'linter_warnings': 'warning',
      \'linter_errors': 'error',
      \'linter_ok': 'left',
      \}

let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "
