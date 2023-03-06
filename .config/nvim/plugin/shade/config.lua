require("if_installed")("shade", function(shade)
  shade.setup({
    overlay_opacity = 80,
    opacity_step = 1,
    keys = {
      -- brightness_up = "<C-Up>",
      -- brightness_down = "<C-Down>",
      -- toggle = "<Leader>s",
    },
  })
end)
