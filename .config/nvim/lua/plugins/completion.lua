return {
	{
		enabled = false,
		"zbirenbaum/copilot.lua",
		cmd = { "Copilot" },
		opts = { keymap = { accept = "<a-n>" } },
	},

	{
		"SirVer/ultisnips",
		dependencies = { "honza/vim-snippets" },
		init = function()
			vim.g.UltiSnipsExpandTrigger = "<c-l>"
			vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
			vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
			vim.g.UltiSnipsSnippetDirectories = { "Ultisnips" }
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"dmitmel/cmp-cmdline-history",
			"quangnguyen30192/cmp-nvim-ultisnips",
			{ "ray-x/cmp-treesitter", dependencies = { "nvim-treesitter/nvim-treesitter" } },
			"roobert/tailwindcss-colorizer-cmp.nvim",
			"onsails/lspkind.nvim",
		},

		config = function()
			local cmp = require("cmp")

			vim.lsp.config("*", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["UltiSnips#Anon"](args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<A-n>"] = cmp.mapping.complete(),

					["<C-CR>"] = cmp.mapping.confirm(),
				},

				sources = {
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lsp" },
					{ name = "ultisnips" },
					{ name = "treesitter" },
					{ name = "path" },
				},

				formatting = {
					format = require("lspkind").cmp_format({
						before = require("tailwindcss-colorizer-cmp").formatter,
					}),
				},
			})

			cmp.setup.filetype({ "markdown", "gitcommit" }, { enabled = false })

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
		end,
	},

	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		config = true,
		keys = {
			{ "<leader>a", nil, desc = "AI/Claude Code" },
			{ "<leader>ac", "<cmd>ClaudeCode<cr>", mode = { "n" }, desc = "Toggle Claude" },
			{ "<C-a>", "<cmd>ClaudeCode<cr>", mode = { "t", "n" }, desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil" },
			},
			-- Diff management
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		},
	},
}
