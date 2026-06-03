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
				-- css = { "stylelint" },
				-- html = { "stylelint" },
				-- scss = { "stylelint" },
				-- rust = { "clippy" },
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
		"mfussenegger/nvim-dap",
		build = ":helptags ALL",
		config = function()
			local dap = require("dap")

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "js-debug-adapter",
					args = { "${port}" },
				},
			}

			dap.configurations.javascript = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
			}
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
				sql = { "sql_formatter" },
				astro = { "prettierd" },
				caddy = { "caddy_fmt" },
			},
			formatters = {
				caddy_fmt = {
					command = "caddy",
					args = { "fmt", "-" },
					stdin = true,
				},
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
}
