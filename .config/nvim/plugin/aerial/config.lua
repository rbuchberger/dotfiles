require("if_installed")("aerial", function(aerial)
  require("map")("n", "<leader><Tab>", "<cmd>AerialToggle<cr>")

  aerial.setup({
    filter_kind = false,
  })
end)
