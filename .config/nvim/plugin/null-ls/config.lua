local ireq = require("if_installed")
ireq("null-ls", function(null_ls)
  local diagnostics = null_ls.builtins.diagnostics
  local formatting = null_ls.builtins.formatting
  local code_actions = null_ls.builtins.code_actions

  local npm_config = {
    -- prefer_local = "node_modules/.bin",
  }

  null_ls.setup({
    debug = true,
    diagnostics_format = "#{m} [#{s}]",
    on_attach = require("lsp_on_attach"),
    sources = {
      -- Javascript:
      diagnostics.eslint_d.with({
        -- ignore prettier warnings from eslint-plugin-prettier
        filter = function(diagnostic)
          return diagnostic.code ~= "prettier/prettier"
        end,
      }),
      formatting.eslint_d.with(npm_config),
      code_actions.eslint_d.with(npm_config),
      formatting.prettier_d_slim.with({ filetypes = { "css", "scss" } }),

      --Typescript
      require("typescript.extensions.null-ls.code-actions"),

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
      diagnostics.luacheck.with({
        extra_args = { "--globals", "vim" },
      }),

      -- vimscript:
      diagnostics.vint,

      -- dockerfiles:
      diagnostics.hadolint,

      -- YAML
      diagnostics.yamllint,

      -- Markdown
      formatting.markdownlint.with({ line_length = false }),
    },
  })
end)
