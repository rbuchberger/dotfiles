-- local javascriptFormatters = { "prettierd" }
-- local javascriptLinters = { "eslint" }

-- Mason prepends its bin to PATH, so a bare "sqruff" finds the real binary
-- rather than the wrapper supplying our postgres default.
local sqruff = vim.fn.expand("~/.local/bin/sqruff")

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
				sql = { "sqruff" },
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

			lint.linters.sqruff = vim.tbl_extend("force", lint.linters.sqruff, { cmd = sqruff })

			vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
				callback = function(args)
					local path = vim.api.nvim_buf_get_name(args.buf)
					local dir = vim.fn.fnamemodify(path, ":p:h")

					local names = nil
					if vim.bo[args.buf].filetype == "sql" and path:find("/drizzle/", 1, true) then
						names = { "sqruff", "squawk" }
					end

					-- sqruff reads config only from its cwd, so both this and conform
					-- must anchor on the buffer for the wrapper to resolve the same one.
					lint.try_lint(names, { cwd = vim.fn.isdirectory(dir) == 1 and dir or nil })
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
				-- typescript = javascriptFormatters,
				-- javascript = javascriptFormatters,
				-- typescriptreact = javascriptFormatters,
				-- javascriptreact = javascriptFormatters,
			-- json = { "prettier" },
			-- yaml = { "yamllint" }, -- linter, not formatter; yamlls handles this via lsp_format fallback
			-- html = { "prettier" },
				-- css = { "prettierd" },
				rust = { "rustfmt" },
				sql = { "sqruff" },
			-- astro = { "prettierd" },
			caddy = { "caddy_fmt" },
		},
		formatters = {
			sqruff = {
				command = sqruff,
				-- sqruff fix writes the formatted file but still exits 1 if any
				-- unfixable rule (AL06, LT05) is left over.
				exit_codes = { 0, 1 },
				cwd = function(_, ctx)
					return ctx.dirname
				end,
			},
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
					lsp_format = "fallback",
				}, overrides or {}))
			end

			vim.keymap.set("n", "<leader>f", function()
				format(vim.api.nvim_get_current_buf())
			end, { noremap = true })
		end,
	},
}
