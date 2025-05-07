local javascriptFormatters = { "prettierd" }
-- local javascriptLinters = { "eslint" }

return {
	{
		"mfussenegger/nvim-lint",
		dependencies = { "williamboman/mason.nvim" },

		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				lua = { "luacheck" },
				-- typescript = javascriptLinters,
				-- javascript = javascriptLinters,
				-- javascriptreact = javascriptLinters,
				-- typescriptreact = javascriptLinters,
				json = { "jsonlint" },
				-- markdown = { "markdownlint" },
				yaml = { "yamllint" },
				css = { "stylelint" },
				html = { "stylelint" },
				scss = { "stylelint" },
			}

			lint.linters.luacheck = vim.tbl_extend("force", lint.linters.luacheck, {
				args = { "--globals", "vim", "--" },
			})

			vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				markdown = { "markdownlint" },
				typescript = javascriptFormatters,
				javascript = javascriptFormatters,
				typescriptreact = javascriptFormatters,
				javascriptreact = javascriptFormatters,
				json = { "prettier" },
				yaml = { "yamllint" },
				html = { "prettier" },
				css = { "prettierd" },
				rust = { "rustfmt" },
				sql = { "sleek" },
			},
		},

		config = function(_, opts)
			require("conform").setup(opts)

			local function format(bufnr, overrides)
				require("conform").format(vim.tbl_extend("force", {
					bufnr = bufnr,
					timeout_ms = 500,
					async = true,
				}, overrides or {}))
			end

			vim.keymap.set("n", "<leader>f", function()
				format(vim.api.nvim_get_current_buf())
			end, { noremap = true })
		end,
	},

	{
		"piersolenski/wtf.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{
				"<leader>ai",
				mode = { "n", "x" },
				function()
					require("wtf").ai()
				end,
				desc = "Debug diagnostic with AI",
			},
			{
				mode = { "n" },
				"<leader>as",
				function()
					require("wtf").search()
				end,
				desc = "Search diagnostic with Google",
			},
			{
				mode = { "n" },
				"<leader>ah",
				function()
					require("wtf").history()
				end,
				desc = "Populate the quickfix list with previous chat history",
			},
			{
				mode = { "n" },
				"<leader>ag",
				function()
					require("wtf").grep_history()
				end,
				desc = "Grep previous chat history with Telescope",
			},
		},
	},
}
