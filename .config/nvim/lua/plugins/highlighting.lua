return {
	{
		"NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
		opts = { user_default_options = { tailwind = true, mode = "virtualtext", virtualtext = "⬤" } },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },

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
					"ruby",
					"rust",
					"sql",
					"tsx",
					"typescript",
					"vimdoc",
					"yaml",
				},

				textobjects = {
					select = {
						lookahead = true,
						keymaps = {
							["am"] = "@function.outer",
							["im"] = "@function.inner",
							["ac"] = "@comment.outer",
							["ic"] = "@comment.inner",
							["ib"] = "@block.inner",
							["ab"] = "@block.outer",
						},
					},
				},

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "<C-n>",
						scope_incremental = "<C-c>",
						node_decremental = "<C-m>",
					},
				},
			})
		end,
	},
}
