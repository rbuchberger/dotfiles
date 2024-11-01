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
map("t", "<A-ESC>", "<ESC>", { noremap = true })
map("t", "<ESC>", "<C-\\><C-n>", { noremap = true })
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
vim.opt.updatetime = 150
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.wrap = false

vim.opt.foldopen = vim.opt.foldopen + "all"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 12

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 5
vim.opt.showmatch = true
vim.opt.number = true
vim.opt.colorcolumn = "81"

vim.opt.termguicolors = true

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

require("config.lazy")
