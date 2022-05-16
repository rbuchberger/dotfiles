local lspconfig = require("lspconfig")
local on_attach = require("lsp_on_attach")
local ts_utils = require("nvim-lsp-ts-utils")

local function preview_location_callback(_, _, result)
	if result == nil or vim.tbl_isempty(result) then
		return nil
	end
	vim.lsp.util.preview_location(result[1])
end

lspconfig.tsserver.setup({
	init_options = ts_utils.init_options,
	on_attach = function(client, bufnr)
		-- Disable formatting to avoid conflict with eslint
		client.resolved_capabilities.document_formatting = false
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

lspconfig.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})

local servers = { "solargraph", "tailwindcss" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	})
end
