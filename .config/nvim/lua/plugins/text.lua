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
	{
    "windwp/nvim-ts-autotag",
    filetypes = {
      "html",
      "xml",
      "typescriptreact",
      "javascriptreact",
      "vue",
      "svelte",
    },
    opts = {},
  },
	{
		"numToStr/Comment.nvim",
    event = "VeryLazy",
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

			vim.keymap.set("n", "gS", "<cmd>TSJSplit<CR>", { silent = true })
			vim.keymap.set("n", "gJ", "<cmd>TSJJoin<CR>", { silent = true })
		end,
	},

	{
		"johmsalas/text-case.nvim",
		opts = {},

		keys = {
			"ga", -- Default invocation prefix
			{ "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
		},
		cmd = {
			-- NOTE: The Subs command name can be customized via the option "substitude_command_name"
			"Subs",
			"TextCaseOpenTelescope",
			"TextCaseOpenTelescopeQuickChange",
			"TextCaseOpenTelescopeLSPChange",
			"TextCaseStartReplacingCommand",
		},
		-- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
		-- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
		-- available after the first executing of it or after a keymap of text-case.nvim has been used.
		lazy = false,
	},

	{
		"gbprod/substitute.nvim",
		opts = {},
		config = function(opts)
			local substitute = require("substitute")
			substitute.setup(opts)

			vim.keymap.set("n", "s", substitute.operator, { noremap = true })
			vim.keymap.set("n", "ss", substitute.line, { noremap = true })
			vim.keymap.set("n", "S", substitute.eol, { noremap = true })
			vim.keymap.set("x", "s", substitute.visual, { noremap = true })
		end,
	},
}
