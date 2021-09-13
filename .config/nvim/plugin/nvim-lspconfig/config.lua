local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
local aerial = require("aerial")

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 500)]])

	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "<C-j>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	buf_set_keymap("n", "<Tab>", "<cmd>AerialToggle! right<CR>", opts)
	buf_set_keymap("n", "{", "<cmd>AerialPrev<CR>", opts)
	buf_set_keymap("n", "}", "<cmd>AerialNext<CR>", opts)
	buf_set_keymap("n", "<Leader>k", "<cmd> lua PeekDefinition()<CR>", opts)

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		update_in_insert = false,
		virtual_text = false,
		signs = true,
		underline = true,
	})

	aerial.on_attach(client)
end

local function preview_location_callback(_, _, result)
	if result == nil or vim.tbl_isempty(result) then
		return nil
	end
	vim.lsp.util.preview_location(result[1])
end

-- I don't know if this should be here, but it's super cool!
function PeekDefinition()
	local params = vim.lsp.util.make_position_params()
	return vim.lsp.buf_request(0, "textDocument/definition", params, preview_location_callback)
end

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.config({
	diagnostics_format = "#{m} [#{s}]",

	sources = {
		-- Javascript:
		diagnostics.eslint_d,
		formatting.eslint_d,
		-- diagnostics.eslint,
		-- formatting.eslint,
		-- formatting.prettier,

		-- JSON
		formatting.fixjson,

		-- Shell scripts
		diagnostics.shellcheck,
		formatting.shfmt,
		formatting.shellharden,

		-- Lua:
		formatting.stylua,

		-- vimscript:
		diagnostics.vint,

		-- dockerfiles:
		diagnostics.hadolint,

		-- nginx configs
		formatting.nixfmt,

		-- SQL
		formatting.sqlformat,
	},
})

lspconfig.tsserver.setup({
	on_attach = function(client)
		-- Disable formatting to avoid conflict with eslint
		client.resolved_capabilities.document_formatting = false
		on_attach(client)
	end,
})

local servers = { "null-ls", "solargraph" }

-- vim.lsp.set_log_level("debug")

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	})
end
