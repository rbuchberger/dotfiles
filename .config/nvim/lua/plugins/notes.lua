-- Lets the global <leader>z mappings find the notebook from outside ~/zk.
vim.env.ZK_NOTEBOOK_DIR = vim.env.ZK_NOTEBOOK_DIR or vim.fn.expand("~/zk")

return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			image = {
				enabled = true,
				doc = { inline = false, float = true, max_width = 80, max_height = 40 },
			},
		},
	},
	{
		"zk-org/zk-nvim",
		name = "zk",
		dependencies = { "nvim-telescope/telescope.nvim" },
		ft = "markdown",
		cmd = { "ZkNew", "ZkNotes", "ZkTags", "ZkMatch", "ZkIndex" },
		keys = {
			{ "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", desc = "New note" },
			{ "<leader>zd", "<Cmd>ZkNew { dir = 'Journals' }<CR>", desc = "Today's journal" },
			{ "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", desc = "Open note" },
			{ "<leader>zt", "<Cmd>ZkTags<CR>", desc = "Notes by tag" },
			{
				"<leader>zf",
				"<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
				desc = "Search notes",
			},
			{ "<leader>zf", ":'<,'>ZkMatch<CR>", mode = "v", desc = "Search notes for selection" },
		},

		config = function()
			require("zk").setup({ picker = "telescope" })

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					if vim.lsp.get_client_by_id(event.data.client_id).name ~= "zk" then
						return
					end
					local function map(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
					end

					map("n", "<CR>", vim.lsp.buf.definition, "Follow link")
					map("n", "K", vim.lsp.buf.hover, "Preview linked note")
					map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", "Backlinks")
					map("n", "<leader>zl", "<Cmd>ZkLinks<CR>", "Outgoing links")
					map("n", "<leader>zi", "<Cmd>ZkInsertLink<CR>", "Insert link")
					map("v", "<leader>zi", ":'<,'>ZkInsertLinkAtSelection<CR>", "Link selection")
					map("v", "<leader>zn", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", "New note from selection")
				end,
			})
		end,
	},
}
