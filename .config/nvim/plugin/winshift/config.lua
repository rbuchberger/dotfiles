require("winshift").setup({
	highlight_moving_win = true,
	focused_hl_group = "Visual",
	-- moving_win_options = {
	--   wrap = false,
	--   cursorline = false,
	--   cursorcolumn = false,
	--   colorcolumn = "",
	-- }
})

vim.api.nvim_set_keymap("n", "<A-w>", ":WinShift<CR>", { noremap = true })
