return {
	{
		"sudormrfbin/cheatsheet.nvim",
		keys = { "<F2>", "g<F2>" },
		config = function()
			vim.keymap.set("n", "<F2>", "<cmd>Cheatsheet<cr>")
			vim.keymap.set("n", "g<F2>", "<cmd>CheatsheetEdit<cr>")
		end,
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
			"<C-p>",
			"<leader>p",
			"<M-p>",
			"<leader>b",
			"<C-g>",
			"<F1>",
			"<M-z>",
			"<M-t>",
			"<leader>i",
			"<leader>`",
			"<leader>gc",
			"<leader>gt",
			"<leader>gs",
			"<leader>gh",
			"<leader>gb",
			"<leader>=",
			"<leader>gr",
			"<leader>gd",
			"<leader>gi",
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

			vim.keymap.set("n", "<C-p>", builtin.find_files)
			vim.keymap.set("n", "<leader>p", builtin.live_grep)
			vim.keymap.set("n", "<M-p>", builtin.current_buffer_fuzzy_find)
			vim.keymap.set("n", "<leader>b", builtin.buffers)
			vim.keymap.set("n", "<C-g>", builtin.builtin)
			vim.keymap.set("n", "<F1>", builtin.help_tags)
			vim.keymap.set("n", "<M-z>", builtin.resume)
			vim.keymap.set("n", "<M-t>", builtin.tagstack)
			vim.keymap.set("n", "<leader>i", builtin.diagnostics) -- mnemonic: issues
			vim.keymap.set("n", "<leader>`", builtin.marks)
			vim.keymap.set("n", "<leader>gc", builtin.lsp_document_symbols) -- mnemonic: code or constants
			vim.keymap.set("n", "<leader>gt", builtin.treesitter) -- mnemonic: code or constants

			vim.keymap.set("n", "<Leader>=", builtin.spell_suggest)
			vim.keymap.set("n", "<leader>gs", builtin.git_status) -- mnemonic: git status
			vim.keymap.set("n", "<leader>gh", builtin.git_bcommits) -- mnemonic: git history
			vim.keymap.set("n", "<leader>gb", builtin.git_branches) -- mnemonic: git branch
			vim.keymap.set("n", "gr", builtin.lsp_references) -- mnemonic: goto references
			vim.keymap.set("n", "gd", builtin.lsp_definitions) -- mnemonic: goto definition
			vim.keymap.set("n", "g<Tab>", telescope.extensions.aerial.aerial) -- mnemonic: goto definition
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

	-- lazy.nvim
	{
		"sontungexpt/buffer-closer",
		event = "VeryLazy",
		opts = {
			min_remaining_buffers = 7, -- can not be less than 1
			retirement_minutes = 10, -- can not be less than 1

			-- close the buffer when the given events are triggered (see :h autocmd-events)
			-- if the value is "default", the plugin will use the default events
			-- if the value is "disabled", the plugin will not use any events
			-- if the value is a table, the plugin will use the given events
			events = "default", -- (table, "default", "disabled"):

			timed_check = {
				enabled = false,
				interval_minutes = 1, -- can not be less than 1
			},

			excluded = {
				filetypes = { "lazy", "NvimTree", "mason" },
				buftypes = { "terminal", "nofile", "quickfix", "prompt", "help" },
				filenames = {},
			},

			-- it means that a buffer will not be closed if it is opened in a window
			ignore_working_windows = true,
		},
	},
}
