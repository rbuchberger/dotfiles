return {
	{ "tpope/vim-unimpaired" },
	{ "nvim-lua/popup.nvim" },
	{ "tpope/vim-ragtag" },
	{ "tpope/vim-repeat" },
	{ "godlygeek/tabular" },
	{ "RishabhRD/popfix" },
	{ "windwp/nvim-autopairs", opts = {} },
	{ "utilyre/sentiment.nvim", opts = {} },
	{ "kylechui/nvim-surround", opts = {} },
	{ "windwp/nvim-ts-autotag", opts = {} },
	{
		"numToStr/Comment.nvim",
		dependencies = { { "JoosepAlviste/nvim-ts-context-commentstring", opts = {} } },
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},

	{
		"Wansmer/sibling-swap.nvim",

		opts = {
			-- This doesn't mean use the built-in keymaps, it means sibling-swap should
			-- set keymaps defined below.
			use_default_keymaps = true,

			keymaps = {
				["<C-l>"] = "swap_with_right",
				["<C-h>"] = "swap_with_left",
				-- Swap and change values, i.e. "a > b" becomes "b < a"
				["<C-L"] = "swap_with_right_with_opp",
				["<C-H>"] = "swap_with_left_with_opp",
			},
		},
	},

	{
		"Wansmer/treesj",
		lazy = true,
		keys = { "gS", "gJ" },
		opts = { use_default_keymaps = false, max_join_length = 99999 },
		config = function(_, opts)
			require("treesj").setup(opts)

			vim.api.nvim_set_keymap("n", "gS", ":TSJSplit<CR>", { silent = true })
			vim.api.nvim_set_keymap("n", "gJ", ":TSJJoin<CR>", { silent = true })
		end,
	},
}
