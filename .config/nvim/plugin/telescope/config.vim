scriptencoding

nmap <silent> <C-p> :Telescope find_files<cr>
nmap <silent> <leader>p :Telescope live_grep<cr>
nmap <silent> <leader>b :Telescope buffers<cr>
nmap <silent> <C-g> :Telescope<cr>

lua << EOF
  require("if_installed")("telescope", function(telescope)
    telescope.setup()
  end)
EOF
