call plug#begin('~/.local/share/nvim/plugged')

  " Appearance
  Plug 'hoob3rt/lualine.nvim'
  Plug 'romgrk/barbar.nvim' 
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'savq/melange' " colorscheme

  " Keys
  Plug 'tpope/vim-unimpaired'

  " File opening & Finding
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'ms-jpq/chadtree'

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

  " Completion (cmp and its dependencies)
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-calc'
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'rhysd/git-messenger.vim'
  Plug 'airblade/vim-gitgutter'

  " Language Specific
  Plug 'cespare/vim-toml'
  Plug 'chikamichi/mediawiki.vim'
  Plug 'vim-ruby/vim-ruby'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'rust-lang/rust.vim'
  Plug 'plasticboy/vim-markdown'

call plug#end()

" Input

let mapleader = ' '
nnoremap <silent> <leader>/ :nohlsearch<CR>
tnoremap <silent> <C-q> <C-\><C-n>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>t :CHADopen<CR>

if has('mouse') | set mouse=a | endif

filetype on
filetype plugin on
filetype plugin indent on

augroup formatting
  autocmd FileType * setlocal formatoptions=qnj
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
set updatetime=100
set completeopt=menuone,noselect

set splitright
set splitbelow
set scrolloff=5
set showmatch
set number
set fillchars=eob:\
set colorcolumn=80

set termguicolors
colorscheme melange
