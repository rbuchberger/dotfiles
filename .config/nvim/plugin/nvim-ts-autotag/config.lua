require("if_installed")("nvim-ts-autotag", function(autotag)
  autotag.setup({
    enable_close_on_slash = false,
  })
end)
