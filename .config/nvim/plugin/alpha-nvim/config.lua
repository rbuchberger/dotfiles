require("if_installed")("alpha", function(alpha)
	alpha.setup(
    require("alpha.themes.startify").config
  )

  require("map")("n", "<leader>l", "<cmd>Alpha<cr>")
end)
