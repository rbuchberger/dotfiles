return {
	{
		"NvChad/nvim-colorizer.lua",
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
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = {
					"bash",
					"c",
					"css",
					"csv",
					"diff",
					"dockerfile",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"go",
					"html",
					"javascript",
					"json",
					"lua",
					"markdown_inline",
					"ruby",
					"rust",
					"scss",
					"sql",
					"ssh_config",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"vim",
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
