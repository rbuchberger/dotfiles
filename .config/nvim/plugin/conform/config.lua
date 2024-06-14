require("if_installed")("conform", function(conform)
	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			typescript = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
			javascript = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
			typescriptreact = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
			javascriptreact = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
			json = { "fixjson" },
			markdown = { "markdownlint" },
			yaml = { "yamllint" },
			html = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
		},
	})

	vim.api.nvim_set_keymap(
		"n",
		"<leader>f",
		':lua require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })<CR>',
		{ noremap = true, silent = true }
	)
	-- vim.api.nvim_create_autocmd("BufWritePre", {
	-- 	pattern = "*",
	-- 	callback = function(args)
	-- 		require("conform").format({ bufnr = args.buf })
	-- 	end,
	-- })
end)
