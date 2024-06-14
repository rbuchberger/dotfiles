require("if_installed")("nvim-lint", function(lint)
  lint.linters_by_ft = {
    lua = "luacheck",
    typescript = "eslint_d",
    javascript = "eslint_d",
    javascriptreact = "eslint_d",
    typescriptreact = "eslint_d",
    json = "fixjson",
    markdown = "markdownlint",
    yaml = "yamllint",
    css = "stylelint",
    html = "stylelint",
    scss = "stylelint",
  }

  vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = lint.try_lint,
  })

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = lint.try_lint,
  })
end)
