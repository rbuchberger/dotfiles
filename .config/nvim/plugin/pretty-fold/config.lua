require("if_installed")("pretty-fold", function(pretty_fold)
  pretty_fold.setup({
    sections = {
      left = { "content" },
      right = {
        " ",
        "number_of_folded_lines",
        " ",
        function(config)
          return config.fill_char:rep(3)
        end,
      },
    },
    fill_char = "┈",
  })
end)
