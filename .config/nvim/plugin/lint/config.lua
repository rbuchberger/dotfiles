require("if_installed")("lint", function(lint)
	lint.linters_by_ft = {
		lua = { "luacheck" },
		typescript = { "eslint_d" },
		javascript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescriptreact = { "eslint_d" },
		json = { "jsonlint" },
		markdown = { "markdownlint" },
		yaml = { "yamllint" },
		css = { "stylelint" },
		html = { "stylelint" },
		scss = { "stylelint" },
	}

	vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
		callback = function()
			require("lint").try_lint()
		end,
	})
end)
