return {
	{
		"nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
		version = "*",
		config = {
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {
          config = { icon_preset = "diamond", icons = { todo = false }, }
        },
				["core.dirman"] = { config = {
          workspaces = { main = "~/neorg" },
          default_workspace = "main",
        } },
        ["core.summary"] = {},
        ["core.journal"] = { config = { strategy = "%Y/%m-%d" }},
			},
		},
	},
}
