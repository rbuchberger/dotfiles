require("if_installed")("nvim-autopairs", function(autopairs)
	autopairs.setup({
		ignored_next_char = "[%w%.]",
	})

	autopairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
	autopairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))
end)
