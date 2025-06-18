return {
	{
		"catgoose/nvim-colorizer.lua",
		event = "VeryLazy",
		opts = { user_default_options = { tailwind = true, mode = "virtualtext", virtualtext = "⬤" } },
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

	{
		"nvim-treesitter/nvim-treesitter",

		build = function()
			vim.cmd("TSUpdate")
		end,

		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				modules = {},
				highlight = { enable = true },
				indent = { enable = true },
				auto_install = true,
				sync_install = false,
				ignore_install = { "" },
				ensure_installed = {
					"bash",
					"css",
					"diff",
					"dockerfile",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"html",
					"javascript",
					"json",
					"markdown_inline",
					"nu",
					"ruby",
					"rust",
					"sql",
					"tsx",
					"typescript",
					-- "typescriptreact",
					"vimdoc",
					"yaml",
				},
			})
		end,
	},
}
