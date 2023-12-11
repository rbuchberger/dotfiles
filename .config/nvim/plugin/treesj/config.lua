require("if_installed")("treesj", function(treesj)
  treesj.setup({
    -- your options here
    use_default_keymaps = false,
    max_join_length = 99999,
  })

  vim.api.nvim_set_keymap("n", "gS", ":TSJSplit<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "gJ", ":TSJJoin<CR>", { silent = true })
end)
