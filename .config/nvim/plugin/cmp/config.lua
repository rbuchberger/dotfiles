local cmp = require("cmp")
local lspkind = require("lspkind")

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
require("nvim-autopairs.completion.cmp").setup({
	auto_select = false
})
