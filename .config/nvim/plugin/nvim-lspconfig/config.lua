local if_installed = require("if_installed")
local on_attach = require("lsp_on_attach")
-- local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

if_installed("lspconfig", function(lspconfig)
  lspconfig.lua_ls.setup({
    -- capabilities = cmp_capabilities,
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
    -- capabilities = cmp_capabilities,
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

  lspconfig.tailwindcss.setup({
    on_attach = on_attach,
    -- capabilities = cmp_capabilities,
    flags = {
      debounce_text_changes = 150,
    },
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

  local servers = { "solargraph", "vls" }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
      on_attach = on_attach,
      -- capabilities = cmp_capabilities,
      flags = {
        debounce_text_changes = 150,
      },
    })
  end
end)
