" Change file/rec command.
call denite#custom#var('file/rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" For ripgrep
" Note: rg is faster than ag
call denite#custom#var('file/rec', 'command',
\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])
" For Pt(the platinum searcher)
" NOTE: It also supports windows.
call denite#custom#var('file/rec', 'command',
\ ['pt', '--follow', '--nocolor', '--nogroup',
\  (has('win32') ? '-g:' : '-g='), ''])
" For python script scantree.py
" Read bellow on this file to learn more about scantree.py
call denite#custom#var('file/rec', 'command',
\ ['scantree.py', '--path', ':directory'])

" Change matchers.
call denite#custom#source(
\ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#source(
\ 'file/rec', 'matchers', ['matcher/cpsm'])

" Change sorters.
call denite#custom#source(
\ 'file/rec', 'sorters', ['sorter/sublime'])

" Change default action.
call denite#custom#kind('file', 'default_action', 'split')

" Add custom menus
let s:menus = {}
let s:menus.zsh = {
	\ 'description': 'Edit your import zsh configuration'
	\ }
let s:menus.zsh.file_candidates = [
	\ ['zshrc', '~/.config/zsh/.zshrc'],
	\ ['zshenv', '~/.zshenv'],
	\ ]

let s:menus.my_commands = {
	\ 'description': 'Example commands'
	\ }
let s:menus.my_commands.command_candidates = [
	\ ['Split the window', 'vnew'],
	\ ['Open zsh menu', 'Denite menu:zsh'],
	\ ['Format code', 'FormatCode', 'go,python'],
	\ ]

call denite#custom#var('menu', 'menus', s:menus)

" Ag command on grep source
call denite#custom#var('grep', {
	\ 'command': ['ag'],
	\ 'default_opts': ['-i', '--vimgrep'],
	\ 'recursive_opts': [],
	\ 'pattern_opt': [],
	\ 'separator': ['--'],
	\ 'final_opts': [],
	\ })

" Ack command on grep source
call denite#custom#var('grep', {
	\ 'command': ['ack'],
	\ 'default_opts': [
	\   '--ackrc', $HOME.'/.ackrc', '-H', '-i',
	\   '--nopager', '--nocolor', '--nogroup', '--column'
	\ ],
	\ 'recursive_opts': [],
	\ 'pattern_opt': ['--match'],
	\ 'separator': ['--'],
	\ 'final_opts': [],
	\ })

" Ripgrep command on grep source
call denite#custom#var('grep', {
	\ 'command': ['rg'],
	\ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
	\ 'recursive_opts': [],
	\ 'pattern_opt': ['--regexp'],
	\ 'separator': ['--'],
	\ 'final_opts': [],
	\ })

" Pt command on grep source
call denite#custom#var('grep', {
	\ 'command': ['pt'],
	\ 'default_opts': [
	\   '-i', '--nogroup', '--nocolor', '--smart-case'],
	\ 'recursive_opts': [],
	\ 'pattern_opt': [],
	\ 'separator': ['--'],
	\ 'final_opts': [],
	\ })

" jvgrep command on grep source
call denite#custom#var('grep', {
	\ 'command': ['jvgrep'],
	\ 'default_opts': ['-i'],
	\ 'recursive_opts': ['-R'],
	\ 'pattern_opt': [],
	\ 'separator': [],
	\ 'final_opts': [],
	\ })

" Specify multiple paths in grep source
"call denite#start([{'name': 'grep',
"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])

" Define alias
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#alias('source', 'file/rec/py', 'file/rec')
call denite#custom#var('file/rec/py', 'command',
\ ['scantree.py', '--path', ':directory'])

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" Custom action
" Note: denite#custom#action() with lambda parameter is only vailable
"       in NeoVim; not supported in Vim8.
call denite#custom#action('file', 'test',
      \ {context -> execute('let g:foo = 1')})
call denite#custom#action('file', 'test2',
      \ {context -> denite#do_action(
      \  context, 'open', context['targets'])})
" Source specific action
call denite#custom#action('source/file', 'test',
      \ {context -> execute('let g:bar = 1')})

