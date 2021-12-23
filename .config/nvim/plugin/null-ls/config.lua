local null_ls = require("null-ls")
local on_attach = require("lsp_on_attach")

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions

local npm_config = {
	-- prefer_local = "node_modules/.bin",
}

null_ls.setup({
  debug = true,
	diagnostics_format = "#{m} [#{s}]",
	on_attach = on_attach,

	sources = {
		-- Javascript:
		diagnostics.eslint_d.with(npm_config),
		formatting.eslint_d.with(npm_config),
		code_actions.eslint_d.with(npm_config),
		-- diagnostics.eslint,
		-- formatting.eslint,
		-- formatting.prettier,

		-- css
		formatting.stylelint,

		-- JSON
		formatting.fixjson,

		-- Shell scripts
		diagnostics.shellcheck,
		code_actions.shellcheck,
		formatting.shfmt,
		formatting.shellharden,

		-- Lua:
		formatting.stylua,
		diagnostics.luacheck,

		-- vimscript:
		diagnostics.vint,

		-- dockerfiles:
		diagnostics.hadolint,

		-- nginx configs
		formatting.nixfmt,

		-- SQL
		formatting.sqlformat,

		-- YAML
		diagnostics.yamllint,

		-- TOML
		formatting.taplo,

		-- Markdown
		formatting.markdownlint.with({ line_length = false }),
	},
})
