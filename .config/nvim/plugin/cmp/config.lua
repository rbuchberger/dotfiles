local cmp_ok, cmp = pcall(require, "cmp")
local lspkind_ok, lspkind = pcall(require, "lspkind")

if not (cmp_ok and lspkind_ok) then
  return
end

lspkind.init()

local select_next_item = function()
  cmp.select_next_item({ cmp.SelectBehavior.Insert })
end

local select_prev_item = function()
  cmp.select_prev_item({ cmp.SelectBehavior.Insert })
end

local confirm = function()
  cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
        ["<C-p>"] = cmp.mapping(select_prev_item, { "i", "c" }),
        ["<C-n>"] = cmp.mapping(select_next_item, { "i", "c" }),
        ["<C-e>"] = cmp.mapping(cmp.abort, { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(confirm, { "i", "c" }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "treesitter" },
    { name = "ultisnips" },
    { name = "nvim_lsp_signature_help" },
    { name = "buffer" },
    { name = "path" },
    -- { name = "rg", keyword_length = 3 },
    { name = "calc" },
  },
})

cmp.setup.cmdline(":", {
  sources = {
    { name = "cmdline" },
    { name = "cmdline_history" },
  },
})

cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
    { name = "cmdline_history" },
  },
})

-- set up autopairs
local autopairs_ok, autopairs = pcall(require, "nvim-autopairs.completion.cmp")

if autopairs_ok then
  cmp.event:on("confirm_done", autopairs.on_confirm_done())
else
  print("autopairs.completion.cmp not found")
end
