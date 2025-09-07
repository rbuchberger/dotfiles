return {
	{
		"sudormrfbin/cheatsheet.nvim",
		keys = {
			{ "<F2>", "<cmd>Cheatsheet<cr>", mode = "n" },
			{ "g<F2>", "<cmd>CheatsheetEdit<cr>", "n" },
		},
		cmd = { "Cheatsheet", "CheatsheetEdit" },
	},

	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope-ui-select.nvim",
			"crispgm/telescope-heading.nvim",
			"fhill2/telescope-ultisnips.nvim",
			"debugloop/telescope-undo.nvim",
		},

		lazy = true,
		keys = {
			"<C-g>",
			"<C-p>",
			"<leader>p",
			"<M-p>",
			"<leader>b",
			"<F1>",
			"<M-i>",
			"<leader>`",
			"<leader>gb",
			"<leader>=",
			"<leader>gr",
			"<leader>gd",
		},
		cmd = { "Telescope" },
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							winblend = 10,
							previewer = false,
							borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
							border = true,
						}),
					},
					heading = { treesitter = true },
				},
			})

			telescope.load_extension("ui-select")
			telescope.load_extension("heading")
			telescope.load_extension("ultisnips")
			telescope.load_extension("undo")
			telescope.load_extension("aerial")

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<C-g>", builtin.builtin)
			vim.keymap.set("n", "<C-p>", builtin.find_files)
			vim.keymap.set("n", "<leader>p", builtin.live_grep)
			vim.keymap.set("n", "<M-p>", builtin.current_buffer_fuzzy_find)
			vim.keymap.set("n", "<leader>b", builtin.buffers)
			vim.keymap.set("n", "<F1>", builtin.help_tags)
			vim.keymap.set("n", "<M-i>", builtin.diagnostics) -- mnemonic: issues
			vim.keymap.set("n", "<leader>`", builtin.marks)
			vim.keymap.set("n", "<Leader>=", builtin.spell_suggest)
			vim.keymap.set("n", "<leader>gb", builtin.git_branches) -- mnemonic: git branch
			vim.keymap.set("n", "gr", builtin.lsp_references) -- mnemonic: goto references
			vim.keymap.set("n", "gd", builtin.lsp_definitions) -- mnemonic: goto definition
		end,
	},

	{
		"kyazdani42/nvim-tree.lua",
		lazy = true,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = { "<leader>t", "gt" },
		cmd = { "NvimTreeToggle", "NvimTreeFindFile" },

		opts = {
			sync_root_with_cwd = true,
			view = { width = 40 },
			renderer = {
				highlight_opened_files = "all",
				add_trailing = true,
				highlight_git = true,
				highlight_modified = "icon",
				icons = {
					glyphs = {
						folder = { default = "", open = "🗁", empty = "⦰", empty_open = "⦲" },
					},
				},
			},
		},

		config = function(_, opts)
			local nvim_tree = require("nvim-tree")
			local api = require("nvim-tree.api")
			local map_opts = { noremap = true, silent = true }
			local set_map = vim.api.nvim_set_keymap

			set_map("n", "<leader>t", ":NvimTreeToggle<CR>", map_opts)
			set_map("n", "gt", ":NvimTreeFindFile<CR>", map_opts)

			nvim_tree.setup(opts)

			api.events.subscribe(api.events.Event.FileCreated, function(filename)
				api.tree.open(filename)
			end)
		end,
	},
}
