require("if_installed")("sibling-swap", function(sibling_swap)
	sibling_swap.setup({
    -- This doesn't mean use the built-in keymaps, it means sibling-swap should
    -- set keymaps defined below.
		use_default_keymaps = true,
		keymaps = {
			["<C-l>"] = "swap_with_right",
			["<C-h>"] = "swap_with_left",
      -- Swap and change values, i.e. "a > b" becomes "b < a"
			["<C-L"] = "swap_with_right_with_opp",
			["<C-H>"] = "swap_with_left_with_opp",
		},
	})
end)
