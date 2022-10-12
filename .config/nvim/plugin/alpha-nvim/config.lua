require("if_installed")("alpha", function(alpha)
	alpha.setup(
    require("alpha.themes.startify").config
  )
end)
