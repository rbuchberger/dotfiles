require("if_installed")("treesj", function(treesj)
  treesj.setup({
    -- your options here
    use_default_keymaps = false,
  })

  vim.api.nvim_set_keymap("n", "gS", ":TSJSplit<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "gJ", ":TSJJoin<CR>", { silent = true })
end)
