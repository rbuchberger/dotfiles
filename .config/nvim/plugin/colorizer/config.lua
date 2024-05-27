require("if_installed")("colorizer", function(colorizer)
  colorizer.setup({
    user_default_options = {
      tailwind = true,
      mode = "virtualtext",
      virtualtext = "⬤",
    },
  })
end)
