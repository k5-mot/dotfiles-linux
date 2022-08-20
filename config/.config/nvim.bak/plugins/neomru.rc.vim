" プロジェクトごとに出し分ける
call unite#custom#source(
            \ 'file_mru', 'matchers',
            \ ['matcher_project_files', 'matcher_default', 'matcher_hide_hidden_files'])
