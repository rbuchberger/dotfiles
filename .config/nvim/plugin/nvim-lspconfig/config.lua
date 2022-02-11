local lspconfig = require("lspconfig")
local on_attach = require("lsp_on_attach")

local function preview_location_callback(_, _, result)
  if result == nil or vim.tbl_isempty(result) then
    return nil
  end
  vim.lsp.util.preview_location(result[1])
end

lspconfig.tsserver.setup({
  on_attach = function(client)
    -- Disable formatting to avoid conflict with eslint
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end,
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
