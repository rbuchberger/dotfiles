set textwidth=100
set colorcolumn=101
lua require("cmp").setup({completion = { autocomplete = false}})

# Markdown.vim plugin mappings
imap <c-f> <esc>:TableFormat<cr>
nmap <c-f> :TableFormat<cr>
nmap <silent> <c-i> :Toc<cr>
