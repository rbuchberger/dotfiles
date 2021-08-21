require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },

  indent = {
    enable = false
  },

  textobjects = {
    select = {
      lookahead = true,
      keymaps = {
        ["am"] = "@function.outer",
        ["im"] = "@function.inner",
        ["ac"] = "@comment.outer", -- does not work for ruby
        ["ic"] = "@comment.inner", -- does not work for ruby
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer", -- does not work for ruby
      },
    },
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    }
  }
}
