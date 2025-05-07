return {
	-- {
	-- 	"supermaven-inc/supermaven-nvim",
	-- 	opts = {
	-- 		keymaps = {
	--        accept_word = "<A-space>",
	--        accept_suggestion = "<C-Space>",
	--      },
	-- 		ignore_filetypes = { markdown = true, gitcommit = true, norg = true, NeogitCommitMessage = true },
	-- 		-- disable annoying startup message
	-- 		log_level = "off",
	-- 	},
	-- },

	{
		"zbirenbaum/copilot.lua",
		cmd = { "Copilot" },
		opts = {
			keymap = {
				accept = "<a-n>",
			},
		},
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

					["<C-CR>"] = cmp.mapping.confirm({ select = false }),
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

      -- doesn't work :(
			-- cmp.setup.cmdline({ "/", "?" }, {
			-- 	mapping = cmp.mapping.preset.cmdline(),
			-- 	sources = {
			-- 		{ name = "buffer" },
			-- 	},
			-- })

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})

			-- Only used when copilot is showing virtual text
			-- cmp.event:on("menu_opened", function()
			-- 	vim.b.copilot_suggestion_hidden = true
			-- end)
			--
			-- cmp.event:on("menu_closed", function()
			-- 	vim.b.copilot_suggestion_hidden = false
			-- end)
		end,
	},
}
