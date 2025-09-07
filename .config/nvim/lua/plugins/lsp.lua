return {
	-- LSP status indicator
	{ "j-hui/fidget.nvim", opts = {} },

	{ "dmmulroy/ts-error-translator.nvim", opts = {} },

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"b0o/schemastore.nvim",
			"hrsh7th/nvim-cmp",
			"williamboman/mason.nvim",
		},

		config = function()
			require("mason").setup()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function()
					local opts = { noremap = true, silent = true, buffer = true }
					-- telescope handles some of this functionality
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<Leader>k", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "[i", function()
						vim.diagnostic.jump({ count = -1 })
					end, opts)
					vim.keymap.set("n", "]i", function()
						vim.diagnostic.jump({ count = 1 })
					end, opts)
					-- vim.keymap.set("n", "<leader>f", "vim.lsp.buf.format({ async = true })<CR>", opts)
					vim.keymap.set("n", "<leader>ef", ":LspEslintFixAll<CR>")
				end,
			})

			vim.lsp.config("*", {
				server = {
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
				},
			})

			vim.lsp.config("lua_ls", {
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if
							path ~= vim.fn.stdpath("config")
							and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
						then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							-- Tell the language server which version of Lua you're using (most
							-- likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
							-- Tell the language server how to find Lua modules same way as Neovim
							-- (see `:h lua-module-load`)
							path = {
								"lua/?.lua",
								"lua/?/init.lua",
							},
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								-- Depending on the usage, you might want to add additional paths
								-- here.
								-- '${3rd}/luv/library'
								-- '${3rd}/busted/library'
							},
							-- Or pull in all of 'runtimepath'.
							-- NOTE: this is a lot slower and will cause issues when working on
							-- your own configuration.
							-- See https://github.com/neovim/nvim-lspconfig/issues/3189
							-- library = {
							--   vim.api.nvim_get_runtime_file('', true),
							-- }
						},
					})
				end,
				settings = { Lua = {} },
			})
			vim.lsp.enable("lua_ls")

			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						assist = { importGranularity = "module", importPrefix = "self" },
						cargo = { loadOutDirsFromCheck = true },
						procMacro = { enable = true },
						check = { command = "clippy" },
					},
				},
			})
			vim.lsp.enable("rust_analyzer")

			vim.lsp.config("tailwindcss", {
				settings = {
					tailwindCSS = {
						classAttributes = {
							"class",
							"className",
							"class:list",
							"classList",
							"ngClass",
							"tw",
							"twx",
							"twMerge",
							".*Classes",
						},
						lint = {
							cssConflict = "warning",
							invalidApply = "error",
							invalidConfigPath = "error",
							invalidScreen = "error",
							invalidTailwindDirective = "error",
							invalidVariant = "error",
							recommendedVariantOrder = "warning",
						},
						validate = true,
					},
				},
			})
			vim.lsp.enable("tailwindcss")

			vim.lsp.config("jsonls", {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})

			vim.lsp.config("yamlls", {
				settings = {
					yaml = {
						schemaStore = {
							-- You must disable built-in schemaStore support if you want to use
							-- this plugin and its advanced options like `ignore`.
							enable = false,
							-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			})
			vim.lsp.enable("yamlls")

			vim.lsp.enable("solargraph")
			vim.lsp.enable("eslint")
			vim.lsp.enable("nushell")

			-- Typescript language server
			vim.lsp.enable("vtsls")

      -- Incoming in a future version
			-- vim.lsp.on_type_formatting.enable()
		end,
	},

	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-tree.lua" },

		opts = {},
	},

	{
		"dmmulroy/tsc.nvim",
		lazy = true,
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		opts = {},
	},
}
