set textwidth=100
set colorcolumn=101
set wrap

lua << EOF
  require("if_installed")("cmp", function()
    require("cmp").setup({
      completion = {
        autocomplete = false
      }
    })
  end)
EOF

" Markdown.vim plugin mappings
nmap <c-f> :TableFormat<cr>
nmap <silent> <Tab> :Toc<cr>
