local if_installed = require("if_installed")
local on_attach = require("lsp_on_attach")

-- This one is archived. Keeping config for now, but I'm testing replacements.
if_installed("typescript", function(typescript)
  typescript.setup({
    server = {
      on_attach = function(client, bufnr)
        -- Disable formatting to avoid conflict with eslint
        -- client.server_capabilities.document_formatting = false
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)

        -- ts_utils.setup({
        --   debug = false,
        --   disable_commands = false,
        --   enable_import_on_completion = false,
        --   -- import all
        --   import_all_timeout = 5000, -- ms
        --   -- lower numbers = higher priority
        --   import_all_priorities = {
        --     same_file = 1, -- add to existing import statement
        --     local_files = 2, -- git files or files with relative path markers
        --     buffer_content = 3, -- loaded buffer content
        --     buffers = 4,   -- loaded buffer names
        --   },
        --   import_all_scan_buffers = 100,
        --   import_all_select_source = false,
        --   always_organize_imports = true,
        --   auto_inlay_hints = false,
        --   -- update imports on file move
        --   update_imports_on_move = false,
        --   require_confirmation_on_move = false,
        --   watch_dir = nil,
        -- })

        -- ts_utils.setup_client(client)

        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rnf", ":TypescriptRenameFile<CR>", {})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ci", ":TypescriptAddMissingImports<CR>", {})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cfa", ":TypescriptFixAll<CR>", {})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":TypescriptGoToSourceDefinition<CR>", {})
      end,
    },
  })
end)

-- Candidate replacement: pmizio/typescript-tools.nvim
if_installed("typescript-tools", function(ts_tools)
  ts_tools.setup({
    on_attach = function(client, bufnr)
      -- Disable formatting to avoid conflict with eslint
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      on_attach(client, bufnr)

      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rnf", ":TSToolsRenameFile<CR>", {})
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ci", ":TSToolsAddMissingImports<CR>", {})
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cfa", ":TSToolsFixAll<CR>", {})
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
