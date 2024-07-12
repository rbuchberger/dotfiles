local on_attach = function(_, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local opts = { noremap = true, silent = true }

	-- Using telescope for some of these
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	-- buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<Leader>k", "<cmd> lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "<C-j>", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	-- buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
end

local build_config = function(config)
	return vim.tbl_deep_extend("keep", config, {
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
		on_attach = on_attach,
	})
end

return {
	{
		-- LSP status indicator
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"b0o/schemastore.nvim",
			"hrsh7th/nvim-cmp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"folke/lazydev.nvim",
				ft = "lua",
				dependencies = { "Bilal2453/luvit-meta" },
				opts = {
					library = {
						{ path = "luvit-meta/library", words = { "vim%.uv" } },
					},
				},
			},
		},

		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({})

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup(build_config({
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						diagnostics = { globals = { "vim" } },
						workspace = {
							checkThirdParty = false,
							library = {
								-- vim.api.nvim_get_runtime_file("", true),
								vim.env.VIMRUNTIME .. "/lua",
								-- Depending on the usage, you might want to add additional paths here.
								-- "${3rd}/luv/library"
								-- "${3rd}/busted/library",
							},
						},
					},
				},
			}))

			lspconfig.rust_analyzer.setup(build_config({
				settings = {
					["rust-analyzer"] = {
						assist = { importGranularity = "module", importPrefix = "self" },
						cargo = { loadOutDirsFromCheck = true },
						procMacro = { enable = true },
					},
				},
			}))

			lspconfig.tailwindcss.setup(build_config({
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
			}))

			lspconfig.jsonls.setup(build_config({
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			}))

			lspconfig.yamlls.setup(build_config({
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
			}))

			lspconfig.solargraph.setup(build_config({}))
			lspconfig.vls.setup(build_config({}))
		end,
	},

	{
		"pmizio/typescript-tools.nvim",
		lazy = true,
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },

		opts = build_config({
			on_attach = function(client, bufnr)
				-- Disable formatting to avoid conflict with prettier
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false

				on_attach(client, bufnr)

				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rnf", ":TSToolsRenameFile<CR>", {})
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ci", ":TSToolsAddMissingImports<CR>", {})
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>co", ":TSToolsOrganizeImports<CR>", {})
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cr", ":TSToolsRemoveUnused<CR>", {})
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cf", ":TSToolsFixAll<CR>", {})
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":TSToolsGoToSourceDefinition<CR>", {})
			end,

			settings = {
				expose_as_code_action = { "add_missing_imports", "remove_unused_imports", "organize_imports" },
			},
		}),
	},
}
