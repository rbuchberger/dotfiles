lua << EOF
  require("if_installed")("cmp", function()
    require("cmp").setup({
      completion = {
        autocomplete = false
      }
    })
  end)
EOF
