" Configuration
let g:ale_completion_enabled=1
let g:ale_completion_delay=300
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}

" Mappings
nmap <leader>f :ALEFix<cr>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap gd :ALEGoToDefinition<cr>
nmap gt :ALEGoToTypeDefinition<cr>
nmap gr :ALEFindReferences<cr>
nmap K :ALEHover<cr>
