call plug#begin('~/.local/share/nvim/plugged')

  " Appearance
  " Plug 'hoob3rt/lualine.nvim'
  Plug 'shadmansaleh/lualine.nvim' " Fork with bugfixes
  Plug 'romgrk/barbar.nvim' 
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'sainnhe/gruvbox-material'
  Plug 'sindrets/winshift.nvim'

  " Keys
  Plug 'tpope/vim-unimpaired'

  " File opening & Finding
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-tree.lua'

  " Text manipulation:
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'alvan/vim-closetag'
  Plug 'godlygeek/tabular'
  Plug 'andrewradev/splitjoin.vim'
  Plug 'andrewradev/sideways.vim'
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'

  " Snippets
  Plug 'honza/vim-snippets'
  Plug 'SirVer/ultisnips'

  " LSP & Linting
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'neovim/nvim-lspconfig'
  Plug 'onsails/lspkind-nvim'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'stevearc/aerial.nvim'
  Plug 'rmagatti/goto-preview'
  Plug 'weilbith/nvim-code-action-menu'

  " Completion (cmp and its dependencies)
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-nvim-lua', { 'for': [ 'lua', 'vim' ] }
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-calc'
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'rhysd/git-messenger.vim'
  Plug 'airblade/vim-gitgutter'

  " Language Specific
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  Plug 'chikamichi/mediawiki.vim', { 'for': 'mediawiki' }
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'MaxMEllon/vim-jsx-pretty', { 'for': 'mediawiki' }
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx', 'javascriptreact']}
  Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript', 'tsx', 'typescriptreact']}
  Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'tsx', 'typescriptreact']}
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

  " Other
  Plug 'lewis6991/impatient.nvim' " Remove when released in nvim core

call plug#end()

lua require('impatient')

" Bindings

let mapleader = ' '
nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap <silent> <leader>w :w<CR>

nnoremap <A-h> <ESC><C-w>h
nnoremap <A-j> <ESC><C-w>j
nnoremap <A-k> <ESC><C-w>k
nnoremap <A-l> <ESC><C-w>l
nnoremap <A-x> <ESC><C-w>c
nnoremap <silent> <A-[> :BufferPrevious<cr>
nnoremap <silent> <A-]> :BufferNext<cr>

nnoremap <silent> <A-CR> :terminal<CR>
tnoremap <A-ESC> <ESC>
tnoremap <ESC> <C-\><C-n>

inoremap jk <ESC>

if has('mouse') | set mouse=a | endif

filetype on
filetype plugin on
filetype plugin indent on

augroup formatting
  autocmd FileType * setlocal formatoptions=qnj
augroup END

augroup terminal
  autocmd TermOpen * set filetype=terminal
augroup END

set signcolumn=yes
set textwidth=80
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
set ignorecase
set smartcase
set hidden
set autoread
set undofile
set undodir=~/.local/share/nvim/undo
set updatetime=150
set completeopt=menuone,noselect

set splitright
set splitbelow
set scrolloff=5
set showmatch
set number
set fillchars=eob:\
set colorcolumn=81

set termguicolors

let g:gruvbox_material_ui_contrast='high' " low, high
let g:gruvbox_material_transparent_background=1
let g:gruvbox_material_better_performance=1
let g:gruvbox_material_show_eob=0
let g:gruvbox_material_palette='original' " original, mix, or material.

colorscheme gruvbox-material
