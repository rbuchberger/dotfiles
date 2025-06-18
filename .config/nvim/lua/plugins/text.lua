return {
	{ "tpope/vim-unimpaired" },
	{ "tpope/vim-ragtag" },
	{ "tpope/vim-repeat" },
	{ "windwp/nvim-autopairs", opts = {} },
	{ "utilyre/sentiment.nvim", opts = {} },
	{ "kylechui/nvim-surround", opts = {} },
	{
		"windwp/nvim-ts-autotag",
		filetypes = { "html", "xml", "typescriptreact", "javascriptreact", "vue", "svelte" },
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
		opts = { use_default_keymaps = false, max_join_length = 99999 },
		keys = {
			{ "gS", "<cmd>TSJSplit<CR>", { silent = true } },
			{ "gJ", "<cmd>TSJJoin<CR>", { silent = true } },
		},
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			highlight = {
				backdrop = false,
			},
			modes = {
				char = {
          enabled = false
					-- highlight = { backdrop = false },
				},
			},
		},
  -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
	},
}
