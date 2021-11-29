local cmp_ok, cmp = pcall(require, "cmp")
local lspkind_ok, lspkind = pcall(require, "lspkind")

if not cmp_ok then
	print("cmp missing. Pluginstall?")
	return
end

local formatting

-- if lspkind_ok then
--   formatting
-- else
--   print("lspkind missing. PlugInstall?")
-- end

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind] .. " "
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				nvim_path = "[Path]",
				calc = "[Calc]",
			})[entry.source.name]
			return vim_item
		end,
	},

	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item({ cmp.SelectBehavior.Insert }),
		["<C-n>"] = cmp.mapping.select_next_item({ cmp.SelectBehavior.Insert }),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-Space>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "ultisnips" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "calc" },
	},
})

-- set up autopairs
local autopairs_ok, autopairs = pcall(require, "nvim-autopairs.completion.cmp")

if autopairs_ok then
	cmp.event:on("confirm_done", autopairs.on_confirm_done())
else
	print("autopairs.completion.cmp not found")
end

-- Completion menu type highlighting
vim.cmd [[highlight! link CmpItemAbbrMatchFuzzy Aqua]]
vim.cmd [[highlight! link CmpItemKindText Fg]]
vim.cmd [[highlight! link CmpItemKindMethod Purple]]
vim.cmd [[highlight! link CmpItemKindFunction Purple]]
vim.cmd [[highlight! link CmpItemKindConstructor Green]]
vim.cmd [[highlight! link CmpItemKindField Aqua]]
vim.cmd [[highlight! link CmpItemKindVariable Blue]]
vim.cmd [[highlight! link CmpItemKindClass Green]]
vim.cmd [[highlight! link CmpItemKindInterface Green]]
vim.cmd [[highlight! link CmpItemKindValue Orange]]
vim.cmd [[highlight! link CmpItemKindKeyword Keyword]]
vim.cmd [[highlight! link CmpItemKindSnippet Red]]
vim.cmd [[highlight! link CmpItemKindFile Orange]]
vim.cmd [[highlight! link CmpItemKindFolder Orange]]
