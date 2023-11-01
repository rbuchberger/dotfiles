local if_installed = require("if_installed")
local on_attach = require("lsp_on_attach")

if_installed("typescript-tools", function(ts_tools)
  ts_tools.setup({
    on_attach = function(client, bufnr)
      -- Disable formatting to avoid conflict with eslint
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
      expose_as_code_action = {
        "add_missing_imports",
        "remove_unused_imports",
        "organize_imports",
      },
    },
  })
end)
