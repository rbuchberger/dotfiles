local nvim_lsp = require("lspconfig")
local null_ls = require("null-ls")
local aerial = require("aerial")

local on_attach = function(client, bufnr)
	aerial.on_attach(client)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- defaults
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

	-- aerial
	buf_set_keymap("n", "<leader>o", "<cmd>AerialToggle! right<CR>", opts)
	buf_set_keymap("n", "{", "<cmd>AerialPrev<CR>", opts)
	buf_set_keymap("n", "}", "<cmd>AerialNext<CR>", opts)
	buf_set_keymap("n", "[[", "<cmd>AerialPrevUp<CR>", opts)
	buf_set_keymap("n", "]]", "<cmd>AerialNextUp<CR>", opts)

	-- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	-- buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	-- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	-- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		update_in_insert = false,
		virtual_text = false,
	})
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
		diagnostics.selene,

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

nvim_lsp.tsserver.setup({
	on_attach = function(client)
		-- Disable formatting to avoid conflict with eslint
		client.resolved_capabilities.document_formatting = false
		on_attach(client)
	end,
})

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "solargraph", "null-ls" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	})
end
