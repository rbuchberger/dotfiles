local map_opts = { noremap = true, silent = true }
local set_map = vim.api.nvim_set_keymap
local nvim_tree = require("nvim-tree")

set_map("n", "<leader>t", ":NvimTreeToggle<CR>", map_opts)
set_map("n", "gt", ":NvimTreeFindFile<CR>", map_opts)

nvim_tree.setup({
	update_cwd = true,
	diagnostics = {
		enable = true,
	},
	view = {
		width = 40,
	},
	renderer = {
		highlight_opened_files = "all",
		add_trailing = false,
	},
})
