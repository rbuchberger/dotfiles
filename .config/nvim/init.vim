call plug#begin('~/.local/share/nvim/plugged')

  " UI
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'akinsho/bufferline.nvim'
  Plug 'tpope/vim-unimpaired'
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'rktjmp/lush.nvim'
  Plug 'ellisonleao/gruvbox.nvim'

  " Tried it, it doesn't work right now. Check back later:
  " Plug 'famiu/bufdelete.nvim' 

  " File opening & Finding
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kevinhwang91/rnvimr'
  Plug 'RishabhRD/popfix' " required for lsputils
  Plug 'RishabhRD/nvim-lsputils'

  " Text manipulation:
  Plug 'alvan/vim-closetag'
  Plug 'andrewradev/splitjoin.vim'
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'AndrewRadev/sideways.vim'
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'tpope/vim-commentary'

  " Snippets
  Plug 'honza/vim-snippets'
  Plug 'SirVer/ultisnips'

  " Linting
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'neovim/nvim-lspconfig'
  Plug 'onsails/lspkind-nvim'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'stevearc/aerial.nvim'

  " cmp and its deps
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-calc'

  " Git
  Plug 'rhysd/git-messenger.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Language Specific
  Plug 'cespare/vim-toml'
  Plug 'chikamichi/mediawiki.vim'

  " Ruby
  Plug 'vim-ruby/vim-ruby'
  " Plug 'tpope/vim-rails'
  " Plug 'tpope/vim-bundler'
  " Plug 'tpope/vim-endwise'

  " React & Javascript
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'HerringtonDarkholme/yats.vim'

  " Rust
  Plug 'rust-lang/rust.vim'

  " Markdown-composer must be recompiled whenever it changes. If the compile
  " fails, run $ rustup --update
  function! BuildComposer(info)
    if a:info.status != 'unchanged' || a:info.force
      !cargo build --release --locked
    endif
  endfunction

  Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
  Plug 'plasticboy/vim-markdown'

call plug#end()

set completeopt=menuone,noselect

" Keybindings

" Set leader to spacebar
let mapleader = " "
" Cancel a search with leader+h:
nnoremap <silent> <leader>/ :nohlsearch<CR>
" Get out of terminal mode with ctrl+q:
tnoremap <silent> <C-q> <C-\><C-n>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> ]w :tabnext<CR>
nnoremap <silent> [w :tabprev<CR>

" Select last pasted text
nnoremap gp `[v`]

" Delete a buffer
nmap <silent> <leader>x :bdelete<CR>

" Input  behavior
autocmd FileType * setlocal formatoptions=qnj
set textwidth=80
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
set ignorecase
set smartcase
set hidden
" Update time in ms. Makes gitgutter signs react faster.
set updatetime=100
set autoread " Auto-reload files when changed on disk
set signcolumn=yes " use number column for git signs and stuff

" Persistent undo:
set undofile
set undodir=~/.local/share/nvim/undo

filetype on
filetype plugin on
filetype plugin indent on

" Yeah, yeah.
if has('mouse')
  set mouse=a
endif

" Display behavior
set splitright         "  open vertical splits on the right
set splitbelow         "  open the horizontal split below
set scrolloff=5        "  keep a 5 line padding when moving the cursor
set showmatch          "  Shows matching parenthesis
set number             "  Show current line number
set fcs=eob:\          "  Disable blank line tildes
set colorcolumn=80     "  Add a mark at 80 characters

" Color config
set termguicolors
let g:gruvbox_italic = 1
let g:grubox_italicize_strings = 1
let g:gruvbox_undercurl = 0
colorscheme gruvbox

let g:vimspector_enable_mappings = 'HUMAN'
