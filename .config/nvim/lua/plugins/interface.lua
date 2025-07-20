return {
	{ "luukvbaal/stabilize.nvim", opts = {} },
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		opts = { scope = { show_end = false, show_start = false } },
	},

	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000, -- Main colorscheme
		config = function()
			vim.g.gruvbox_material_foreground = "original"
			vim.g.gruvbox_material_enable_bold = 1
			vim.g.gruvbox_material_enable_italic = 1
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_dim_inactive_windows = 1
			vim.g.gruvbox_material_show_eob = 0

			vim.cmd.colorscheme("gruvbox-material")
		end,
	},

	{
		"stevearc/aerial.nvim",
		opts = { filter_kind = false },
		keys = { "<leader><Tab>" },
		config = function(_, opts)
			vim.keymap.set("n", "<leader><Tab>", "<cmd>AerialToggle<cr>", { noremap = true })

			require("aerial").setup(opts)
		end,

		lazy = true,
	},

	{
		"goolord/alpha-nvim",
		keys = { { "<leader>l", "<cmd>Alpha<cr>", mode = "n", { noremap = true } } },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
		priority = 1000, -- It's the startup screen
		lazy = false,
	},

	-- {
	-- 	"gorbit99/codewindow.nvim",
	-- 	keys = {
	-- 		{
	-- 			"<leader>m",
	-- 			function()
	-- 				local codewindow = require("codewindow")
	--
	-- 				if require("codewindow.window").is_minimap_open() then
	-- 					codewindow.close_minimap()
	-- 				else
	-- 					codewindow.open_minimap()
	-- 					codewindow.toggle_focus()
	-- 				end
	-- 			end,
	-- 			mode = "n",
	-- 			noremap = true,
	-- 		},
	-- 	},
	-- },

	{
		"sindrets/winshift.nvim",
		keys = { { "<A-w>", "<cmd>WinShift<CR>", mode = "n", noremap = true } },

		opts = {
			highlight_moving_win = true,
			focused_hl_group = "Visual",
			moving_win_options = {
				wrap = false,
				cursorline = false,
				cursorcolumn = false,
				colorcolumn = "",
			},
		},
	},

	{
		"nvim-lualine/lualine.nvim",

		dependencies = { "nvim-tree/nvim-web-devicons", "sainnhe/gruvbox-material" },
		lazy = false,

		opts = {
			options = { theme = "gruvbox-material", globalstatus = true },

			sections = {
				lualine_a = { "branch" },
				lualine_b = { "filetype" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "diff", { "diagnostics", sources = { "nvim_diagnostic" } } },
				lualine_y = { "location" },
				lualine_z = { "mode" },
			},

			inactive_sections = {
				lualine_a = { { "filename", path = 1 } },
				lualine_b = {},
				lualine_c = { "diff" },
				lualine_x = {},
				lualine_y = { { "diagnostics", sources = { "nvim_diagnostic" } } },
				lualine_z = {},
			},

			tabline = {},
			extensions = { "nvim-tree", "quickfix" },
		},
	},

	{
		"romgrk/barbar.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "lewis6991/gitsigns.nvim" },
		lazy = false,

		opts = { animation = false, auto_hide = true },

		keys = {
			{ "<leader>x", "<cmd>BufferClose<CR>", mode = "n", { noremap = true } },
			{ "[b", "<cmd>BufferPrevious<CR>", mode = "n", { noremap = true } },
			{ "<A-[>", "<cmd>BufferPrevious<CR>", mode = "n", { noremap = true } },
			{ "]b", "<cmd>BufferNext<CR>", mode = "n", { noremap = true } },
			{ "<A-]>", "<cmd>BufferNext<CR>", mode = "n", { noremap = true } },
		},
	},
}
