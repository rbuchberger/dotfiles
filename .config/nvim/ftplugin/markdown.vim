set tw=100
set colorcolumn=100
lua require("cmp").setup({completion = { autocomplete = false}})

# Markdonw.vim plugin mappings
imap <c-f> <esc>:TableFormat<cr>a	
nmap <c-f> :TableFormat<cr>	
nmap <silent> <c-i> :Toc<cr>	
