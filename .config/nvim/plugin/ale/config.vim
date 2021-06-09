let g:ale_enabled=1
" Configuration
let g:ale_set_balloons=0
let g:ale_floating_preview=0
let g:ale_virtualtext_cursor=1
" let g:ale_sign_column_always=0
let g:ale_completion_autoimport=1
let g:ale_floating_window_border=['│', '─', '╭', '╮', '╯', '╰']
let g:ale_completion_enabled=1
let g:ale_completion_delay=200
let g:ale_cursor_detail=0
let g:ale_set_signs=1
let g:ale_close_preview_on_insert=1
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_echo_cursor = 0
let g:ale_echo_delay = 100
let g:ale_lint_delay = 100
let g:ale_lint_on_text_changed = 'normal'
set signcolumn=yes
let g:ale_virtualtext_prefix='🔥'

" Mappings
nmap <silent> <leader>f <Plug>(ale_fix)
nmap <silent> <leader>i <Plug>(ale_import)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <leader>d <Plug>(ale_detail)
nmap <leader>a :ALECodeAction<cr>
nmap <leader>r :ALERename<cr>
nmap gd <Plug>(ale_go_to_definition_in_split)
nmap gD <Plug>(ale_go_to_definition)
nmap gt <Plug>(ale_go_to_type_definition_in_split)
nmap gT <Plug>(ale_go_to_type_definition)
nmap gk <Plug>(ale_documentation)
nmap gr :ALEFindReferences -split<cr>
nmap gR :ALEFindReferences<cr>
nmap K <Plug>(ale_hover)

" nmap <silent> <leader>f :ALEFix<cr>
" nmap <silent> <leader>a :ALECodeAction<cr>
" nmap <silent> <leader>i :ALEImport<cr>
