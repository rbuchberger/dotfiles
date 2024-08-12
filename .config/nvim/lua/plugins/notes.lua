return {
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		version = "*",
		opts = {
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {
					config = { icon_preset = "diamond", icons = { todo = false } },
				},
				["core.dirman"] = {
					config = {
						workspaces = { main = "/Misio/Robert/neorg" },
						default_workspace = "main",
					},
				},
				["core.summary"] = {},
				["core.journal"] = { config = { strategy = "%Y/%m-%d" } },
				["core.completion"] = { config = { engine = "nvim-cmp" } },
			},
		},
		config = function(_, opts)
			vim.keymap.set("n", "<LocalLeader>ni", "<cmd>Neorg index<cr>", { noremap = true })
			vim.keymap.set("n", "<LocalLeader>ns", "<cmd>Neorg generate-workspace-summary<cr>", { noremap = true })
			vim.keymap.set("n", "<LocalLeader>nm", "<cmd>Neorg inject-metadata<cr>", { noremap = true })
			vim.keymap.set("n", "<LocalLeader>nu", "<cmd>Neorg update-metadata<cr>", { noremap = true })
			vim.keymap.set("n", "<LocalLeader><Tab>", "<cmd>Neorg toc<cr>", { noremap = true })

			vim.keymap.set("n", "<LocalLeader>jt", "<cmd>Neorg journal today<cr>", { noremap = true })
			vim.keymap.set("n", "<LocalLeader>jy", "<cmd>Neorg journal yesterday<cr>", { noremap = true })
			vim.keymap.set("n", "<LocalLeader>jm", "<cmd>Neorg journal tomorrow<cr>", { noremap = true })
			vim.keymap.set("n", "<LocalLeader>jc", "<cmd>Neorg journal custom<cr>", { noremap = true })

			require("neorg").setup(opts)
		end,

		keys = { "<LocalLeader>ni", "<LocalLeader>jt", "<LocalLeader>jy", "<LocalLeader>jm" },
    ft = { "norg" },
    cmd = { "Neorg" },
	},
}
