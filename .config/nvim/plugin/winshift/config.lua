require("if_installed")("winshift", function(winshift)
	winshift.setup({
		highlight_moving_win = true,
		focused_hl_group = "Visual",
		moving_win_options = {
			wrap = false,
			cursorline = false,
			cursorcolumn = false,
			colorcolumn = "",
		},
	})

	vim.api.nvim_set_keymap("n", "<A-w>", "<Cmd>WinShift<CR>", { noremap = true })
end)
