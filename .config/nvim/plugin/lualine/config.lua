require("lualine").setup({
	options = {
		theme = "gruvbox",
	},

	sections = {
		lualine_a = { {
			"filename",
			path = 1,
		} },
		lualine_b = { "filetype" },
		lualine_c = { "branch", "diff" },
		lualine_x = {},
		lualine_y = { {
			"diagnostics",
			sources = { "nvim_lsp" },
		} },
		lualine_z = { "mode" },
	},

	inactive_sections = {
		lualine_a = { {
			"filename",
			path = 1,
		} },
		lualine_b = {},
		lualine_c = { "diff" },
		lualine_x = {},
		lualine_y = { {
			"diagnostics",
			sources = { "nvim_lsp" },
		} },
		lualine_z = {},
	},

	tabline = {},
})
