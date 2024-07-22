return {
	{
		"mfussenegger/nvim-lint",
		dependencies = { "williamboman/mason.nvim" },

		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				lua = { "luacheck" },
				typescript = { "eslint_d" },
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
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

			vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost", "TextChanged" }, {
				callback = function()
					require("lint").try_lint()
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
				typescript = { "prettier" },
				javascript = { "prettier" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "prettier" },
				yaml = { "yamllint" },
				html = { "prettier" },
				css = { "prettier" },
				rust = { "rustfmt" },
			},
		},

		config = function(_, opts)
			require("conform").setup(opts)

			local function format(bufnr)
				require("conform").format({
					bufnr = bufnr,
					timeout_ms = 1000,
					async = true,
				})
			end

			vim.keymap.set("n", "<leader>f", function()
				format(vim.api.nvim_get_current_buf())
			end, { noremap = true })

			-- vim.api.nvim_create_autocmd("BufWritePre", {
			-- 	pattern = "*",
			-- 	callback = function(args)
			-- 		format(args.buf)
			-- 	end,
			-- })
		end,
	},
}
