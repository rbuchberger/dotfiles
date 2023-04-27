require("if_installed")("treesitter-context", function(ts_context)
  ts_context.setup {
    enable = true,
    -- throttle = true,
  }
end)
