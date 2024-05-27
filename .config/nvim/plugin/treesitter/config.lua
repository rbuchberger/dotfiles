require("if_installed")("nvim-treesitter.configs", function(treesitter)
  treesitter.setup({
    highlight = {
      enable = true,
    },

    indent = {
      enable = false,
    },

    textobjects = {
      select = {
        lookahead = true,
        keymaps = {
          ["am"] = "@function.outer",
          ["im"] = "@function.inner",
          ["ac"] = "@comment.outer",
          ["ic"] = "@comment.inner",
          ["ib"] = "@block.inner",
          ["ab"] = "@block.outer", -- does not work for ruby
        },
      },
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "<C-n>",
        scope_incremental = "<C-c>",
        node_decremental = "<C-m>",
      },
    },

    context_commentstring = { enable = true },
  })
end)
