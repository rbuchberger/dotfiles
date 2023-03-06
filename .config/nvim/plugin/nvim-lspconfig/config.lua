local if_installed = require("if_installed")
local on_attach = require("lsp_on_attach")

if_installed("lspconfig", function(lspconfig)
	if_installed("nvim-lsp-ts-utils", function(ts_utils)
		lspconfig.tsserver.setup({
			init_options = ts_utils.init_options,
			on_attach = function(client, bufnr)
				-- Disable formatting to avoid conflict with eslint
				-- client.server_capabilities.document_formatting = false
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
				on_attach(client, bufnr)

				ts_utils.setup({
					debug = false,
					disable_commands = false,
					enable_import_on_completion = false,

					-- import all
					import_all_timeout = 5000, -- ms
					-- lower numbers = higher priority
					import_all_priorities = {
						same_file = 1, -- add to existing import statement
						local_files = 2, -- git files or files with relative path markers
						buffer_content = 3, -- loaded buffer content
						buffers = 4, -- loaded buffer names
					},
					import_all_scan_buffers = 100,
					import_all_select_source = false,
					always_organize_imports = true,

					auto_inlay_hints = false,

					-- update imports on file move
					update_imports_on_move = false,
					require_confirmation_on_move = false,
					watch_dir = nil,
				})

				ts_utils.setup_client(client)

				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rnf", ":TSLspRenameFile<CR>", {})
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gia", ":TSLspImportAll<CR>", {})
			end,
		})
	end)

	lspconfig.lua_ls.setup({
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})

	lspconfig.rust_analyzer.setup({
		on_attach = on_attach,
		settings = {
			["rust-analyzer"] = {
				assist = {
					importGranularity = "module",
					importPrefix = "self",
				},
				cargo = {
					loadOutDirsFromCheck = true,
				},
				procMacro = {
					enable = true,
				},
			},
		},
	})

	local servers = { "solargraph", "tailwindcss", "vls" }

	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			on_attach = on_attach,
			flags = {
				debounce_text_changes = 150,
			},
		})
	end
end)
