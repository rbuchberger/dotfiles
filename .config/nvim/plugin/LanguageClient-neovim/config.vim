let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tsserver'],
    \ 'typescript': ['tsserver'],
    \ 'typescriptreact': ['tsserver'],
    \ 'python': ['pyls'],
    \ 'ruby': ['solargraph', 'stdio'],
    \ }

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
" nmap <silent>K <Plug>(lcn-hover)
" nmap <silent> gd <Plug>(lcn-definition)
" nmap <silent> <F2> <Plug>(lcn-rename)
" nmap <silent> gt <Plug>(lcn-type-definition)
" nmap <silent> gr <Plug>(lcn-references)
" nmap <silent> <leader>a <Plug>(lcn-code-action)
" 
" nmap <leader>f :ALEFix<cr>
" nmap <leader>a :ALECodeAction<cr>
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" nmap gd :ALEGoToDefinition<cr>
" nmap gdd <Plug>(ale_documentation)
" nmap gt :ALEGoToTypeDefinition<cr>
" nmap gr :ALEFindReferences<cr>
" nmap K :ALEHover<cr>
