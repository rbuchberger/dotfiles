require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },

  indent = {
    enable = false
  },
  textobjects = {
    select = {

      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["am"] = "@function.outer",
        ["im"] = "@function.inner",
        ["ac"] = "@comment.outer", -- does not work for ruby
        ["ic"] = "@comment.inner", -- does not work for ruby
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer", -- does not work for ruby

        -- Or you can define your own textobjects like this
        -- ["iF"] = {
        --   python = "(function_definition) @function",
        --   cpp = "(function_definition) @function",
        --   c = "(function_definition) @function",
        --   java = "(method_declaration) @function",
        -- },
      },
    },
  },
}
