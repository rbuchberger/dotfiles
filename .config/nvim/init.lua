-- recommended by nvim-tree to avoid race conditions
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Key mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>/", "<cmd>nohlsearch<CR>", opts)
map("n", "<leader>w", "<cmd>w!<CR>", opts)
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-l>", "<C-w>l", opts)
map("n", "<A-x>", "<C-w>c", opts)
map("n", "<A-CR>", "<cmd>terminal<CR>", opts)
map("t", "<A-ESC>", "<C-\\><C-n>", { noremap = true })
map("t", "<A-h>", "<C-\\><C-n><C-w>h", { noremap = true })
map("t", "<A-j>", "<C-\\><C-n><C-w>j", { noremap = true })
map("t", "<A-k>", "<C-\\><C-n><C-w>k", { noremap = true })
map("t", "<A-l>", "<C-\\><C-n><C-w>l", { noremap = true })
-- map("t", "<A-ESC>", "<ESC>", { noremap = true })
-- map("t", "<ESC>", "<C-\\><C-n>", { noremap = true })
map("i", "jk", "<ESC>", { noremap = true })

-- Enable mouse support if available
if vim.fn.has("mouse") == 1 then
	vim.opt.mouse = "a"
end

-- Enable filetype plugins and indentation
vim.cmd("filetype plugin indent on")

-- General settings
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.textwidth = 80
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoread = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")
vim.opt.updatetime = 1000
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.wrap = false

-- vim.opt.foldopen = vim.opt.foldopen + "all"
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 12

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 5
vim.opt.showmatch = true
vim.opt.number = true
vim.opt.colorcolumn = "81"

vim.opt.termguicolors = true

local toggle_diagnostics = function()
	-- local new_config = not vim.diagnostic.config().virtual_lines
	-- vim.diagnostic.config({ virtual_lines = new_config })
	vim.diagnostic.config({
		virtual_lines = not vim.diagnostic.config().virtual_lines,
	})
end

map("i", "<C-i>", toggle_diagnostics, { desc = "Toggle diagnostic virtual_lines" })
map("n", "<C-i>", toggle_diagnostics, { desc = "Toggle diagnostic virtual_lines" })

-- Formatting autocmd
vim.api.nvim_create_augroup("formatting", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "formatting",
	pattern = "*",
	command = "setlocal formatoptions=qnjlc",
})

-- Terminal autocmd
vim.api.nvim_create_augroup("terminal", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
	group = "terminal",
	pattern = "*",
	command = "set filetype=terminal",
})

-- Enable Treesitter
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*" },
	callback = function(args)
		local ft = vim.bo[args.buf].filetype
		local lang = vim.treesitter.language.get_lang(ft)

		if not lang then
			return
		end

		if not vim.treesitter.language.add(lang) then
			-- this stupid tracking is here only because
			-- they have added warnings on absent parsers
			local available = vim.g.ts_available or require("nvim-treesitter").get_available()
			if not vim.g.ts_available then
				vim.g.ts_available = available
			end

			if vim.tbl_contains(available, lang) then
				require("nvim-treesitter").install(lang)
			end
		end

		if vim.treesitter.language.add(lang) then
			vim.treesitter.start(args.buf, lang)
			-- this is an experimental feature
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.wo[0][0].foldmethod = "expr"
		end
	end,
})

require("config.lazy")
