-- local nvim_tree = require("nvim-tree")
require("if_installed")("nvim-tree", function(nvim_tree)
	local map_opts = { noremap = true, silent = true }
	local set_map = vim.api.nvim_set_keymap

	set_map("n", "<leader>t", ":NvimTreeToggle<CR>", map_opts)
	set_map("n", "gt", ":NvimTreeFindFile<CR>", map_opts)

	nvim_tree.setup({
		sync_root_with_cwd = true,
		diagnostics = {
			enable = true,
		},
		view = {
			width = 40,
		},
		renderer = {
			highlight_opened_files = "all",
			add_trailing = true,
			highlight_git = true,
			highlight_modified = "icon",
			icons = {
				glyphs = {
					folder = {
						default = "",
						open = "🗁",
						empty = "⦰",
						empty_open = "⦲",
					},
				},
			},
		},
	})

	local api = require("nvim-tree.api")

	api.events.subscribe(api.events.Event.FileCreated, function(filename)
		api.tree.open(filename)
	end)
end)
