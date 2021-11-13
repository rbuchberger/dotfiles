local map_opts = { noremap = true, silent = true }
local set_map = vim.api.nvim_set_keymap
local nvim_tree = require("nvim-tree")

set_map("n", "<leader>t", ":NvimTreeToggle<CR>", map_opts)
set_map("n", "gt", ":NvimTreeFindFile<CR>", map_opts)

vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_add_trailing = 1

nvim_tree.setup({
  auto_close = false,
  update_cwd = true,
  hide_dotfiles = false,
  diagnostics = {
    enable = true
  },
  view = {
    width = 40,
  },
})
