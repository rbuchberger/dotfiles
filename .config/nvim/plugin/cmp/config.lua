local cmp_ok, cmp = pcall(require, "cmp")
local lspkind_ok, lspkind = pcall(require, "lspkind")
local tailwind_css_colorizer_ok, tailwind_css_colorizer = pcall(require, "tailwindcss-colorizer-cmp")
local autopairs_ok, autopairs = pcall(require, "nvim-autopairs.completion.cmp")

if not (cmp_ok and lspkind_ok and tailwind_css_colorizer_ok and autopairs_ok) then
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lua" },
    { name = "treesitter" },
    { name = "ultisnips" },
    { name = "buffer" },
    { name = "path" },
    -- { name = "rg", keyword_length = 3 },
    { name = "calc" },
  },

  formatting = {
    format = require("tailwindcss-colorizer-cmp").formatter,
  },
})

cmp.setup.cmdline(":", {
  sources = {
    { name = "cmdline" },
    { name = "cmdline_history" },
  },
})

cmp.setup.cmdline("/", {
  sources = cmp.config.sources({
    { name = "nvim_lsp_document_symbol" },
  }, {
    { name = "buffer" },
  }),
})

cmp.event:on("confirm_done", autopairs.on_confirm_done())
lspkind.init()
tailwind_css_colorizer.setup({ color_square_width = 2 })
