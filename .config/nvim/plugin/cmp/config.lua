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
