require("lualine").setup({
  options = {
    theme = "gruvbox-material",
    globalstatus = true,
  },

  sections = {
    lualine_a = { {
      "filename",
      path = 1,
    } },
    lualine_b = { "filetype" },
    lualine_c = { "branch", "diff" },
    lualine_x = {},
    lualine_y = { {
      "diagnostics",
      sources = { "nvim_diagnostic" },
    } },
    lualine_z = { "mode" },
  },

  inactive_sections = {
    lualine_a = { {
      "filename",
      path = 1,
    } },
    lualine_b = {},
    lualine_c = { "diff" },
    lualine_x = {},
    lualine_y = { {
      "diagnostics",
      sources = { "nvim_diagnostic" },
    } },
    lualine_z = {},
  },

  tabline = {},
  extensions = {'nvim-tree', 'quickfix'}
})
