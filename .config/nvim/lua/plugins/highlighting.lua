return {
	{
		"catgoose/nvim-colorizer.lua",
		event = "VeryLazy",
		opts = { user_default_options = { tailwind = true, mode = "virtualtext", virtualtext = "⬤" } },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
	},

	{
		"aaronik/treewalker.nvim",
		opts = {},

		keys = {
			{ "<C-k>", "<cmd>Treewalker Up<cr>zz", mode = { "n", "v" }, silent = true },
			{ "<C-j>", "<cmd>Treewalker Down<cr>zz", mode = { "n", "v" }, silent = true },
			{ "<C-h>", "<cmd>Treewalker Left<cr>", mode = { "n", "v" }, silent = true },
			{ "<C-l>", "<cmd>Treewalker Right<cr>", mode = { "n", "v" }, silent = true },
			{ "<C-S-k>", "<cmd>Treewalker SwapUp<cr>zz", mode = "n", silent = true },
			{ "<C-S-j>", "<cmd>Treewalker SwapDown<cr>zz", mode = "n", silent = true },
			{ "<C-S-h>", "<cmd>Treewalker SwapLeft<cr>", mode = "n", silent = true },
			{ "<C-S-l>", "<cmd>Treewalker SwapRight<cr>", mode = "n", silent = true },
		},
	},
}
