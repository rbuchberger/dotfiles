require("if_installed")("trouble", function(trouble)
	trouble.setup()

	vim.api.nvim_set_keymap("n", "<leader>i", "<cmd>TroubleToggle<cr>", {
		silent = true,
	})
end)
