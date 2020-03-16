" Use this list instead of CocInstall; that way I can track and sync changes via 
" git.
let g:coc_global_extensions = [
      \ 'coc-word',
      \ 'coc-tag',
      \ 'coc-syntax',
      \ 'coc-snippets',
      \ 'coc-prettier',
      \ 'coc-marketplace',
      \ 'coc-highlight',
      \ 'coc-github',
      \ 'coc-git',
      \ 'coc-explorer',
      \ 'coc-eslint',
      \ 'coc-emoji',
      \ 'coc-dictionary',
      \ 'coc-vimlsp',
      \ 'coc-vetur',
      \ 'coc-tsserver',
      \ 'coc-tslint-plugin',
      \ 'coc-solargraph',
      \ 'coc-sh',
      \ 'coc-rls',
      \ 'coc-python',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-yaml',
      \ 'coc-actions',
      \ 'coc-calc',
      \ 'coc-spell-checker',
      \ 'coc-cspell-dicts',
      \ 'coc-lists',
      \ 'coc-snippets',
      \ 'coc-ultisnips'
      \ ]

" To ensure it doesn't kill performance
set updatetime=300

" keybindings

let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

" ctrl+space triggers completion:
inoremap <silent><expr> <c-space> coc#refresh()
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
nmap <leader>qf  <Plug>(coc-fix-current)
vmap <leader>rn <Plug>(coc-rename)
nmap <silent> <C-l> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-h> <Plug>(coc-diagnostic-next)
nmap <leader>f <Plug>(coc-format)

" Extension Mappings
nmap <leader>t :CocCommand explorer --toggle<cr>
nmap <leader>a :CocCommand actions.open<cr>
nmap <leader>ca <Plug>(coc-calc-result-append)
nmap <leader>cr <Plug>(coc-calc-result-replace)
nmap <leader>h :CocCommand cSpell.toggleEnableSpellChecker<cr>

" Show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
