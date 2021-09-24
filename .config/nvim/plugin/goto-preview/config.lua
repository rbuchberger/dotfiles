require("goto-preview").setup({
	width = 120,
	height = 40,
	default_mappings = false,
	debug = false,
	opacity = nil,
	post_open_hook = nil,
})

vim.api.nvim_set_keymap("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {
	noremap = true,
})

vim.api.nvim_set_keymap("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", {
	noremap = true,
})
