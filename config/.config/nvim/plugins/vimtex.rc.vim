if !exists("g:os")
  if has("win64") || has("win32") || has("win16") || has('win32unix')
    let g:os = "Windows"
  else
    let g:os = substitute(system('uname'), '\n', '', '')
  endif
endif

"" lervag/vimtex
let g:tex_flavor='latex'
let g:vimtex_compiler_progname = 'nvr'
let g:tex_conceal=''
let g:vimtex_compiler_latexmk = {}
let g:vimtex_compiler_latexmk['background'] = 1
let g:vimtex_compiler_latexmk['build_dir'] = ''
let g:vimtex_compiler_latexmk['callback'] = 1
let g:vimtex_compiler_latexmk['continuous'] = 1
let g:vimtex_compiler_latexmk['options']
      \ = ['-pdfdvi',
      \    '-verbose',
      \    '-file-line-error',
      \    '-synctex=1',
      \    '-interaction=nonstopmode',]

if (g:os == "Windows")
  set isfname-={,}
  let g:vimtex_view_general_viewer = 'SumatraPDF'
  let g:vimtex_view_general_options
        \ = '-reuse-instance -forward-search @tex @line @pdf'
  let g:vimtex_view_general_options_latexmk = '-reuse-instance'
elseif (g:os == "Darwin")
  let g:vimtex_view_general_viewer
        \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
  let g:vimtex_view_general_options = '-r @line @pdf @tex'

  " This adds a callback hook that updates
  " Skim after compilation
  let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
  function! UpdateSkim(status)
    if !a:status | return | endif

    let l:out = b:vimtex.out()
    let l:tex = expand('%:p')
    let l:cmd = [g:vimtex_view_general_viewer, '-r']
    if !empty(system('pgrep Skim'))
      call extend(l:cmd, ['-g'])
    endif
    if has('nvim')
      call jobstart(l:cmd + [line('.'), l:out, l:tex])
    elseif has('job')
      call job_start(l:cmd + [line('.'), l:out, l:tex])
    else
      call system(join(l:cmd
            \ + [line('.'),
            \    shellescape(l:out),
            \    shellescape(l:tex)],
            \ ' '))
    endif
  endfunction
endif

if (!has('clientserver') || !has('gui_running'))
  let g:vimtex_compiler_latexmk['callback'] = 0
endif
