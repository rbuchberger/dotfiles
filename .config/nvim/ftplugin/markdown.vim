set textwidth=100
set colorcolumn=101
lua require("cmp").setup({completion = { autocomplete = false}})

" Markdown.vim plugin mappings
nmap <c-f> :TableFormat<cr>
nmap <silent> <Tab> :Toc<cr>
