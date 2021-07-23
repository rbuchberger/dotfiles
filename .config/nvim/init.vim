call plug#begin('~/.local/share/nvim/plugged')

  " UI
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-unimpaired'
  Plug 'ryanoasis/vim-devicons'
  Plug 'morhetz/gruvbox'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'matbme/JABS.nvim'
  Plug 'kevinhwang91/rnvimr'

  " File opening & Finding
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " Text manipulation:
  Plug 'Shougo/context_filetype.vim' " Sets filetype by context. (Vue files)
  Plug 'alvan/vim-closetag'
  Plug 'andrewradev/splitjoin.vim'
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-ragtag' " Shortcut mappings for useful tags
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tyru/caw.vim' " Comment shortcuts
  Plug 'AndrewRadev/sideways.vim'
  Plug 'jiangmiao/auto-pairs'

  " Code Completion and linting:
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'

  " Snippets
  Plug 'honza/vim-snippets'
  Plug 'SirVer/ultisnips'

  " Git
  Plug 'rhysd/git-messenger.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Language Specific
  Plug 'cespare/vim-toml'

  " Ruby
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-endwise'

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
  " Plug 'vim-pandoc/vim-pandoc-syntax' " This is the best markdown synax plugin.
  Plug 'plasticboy/vim-markdown'

  " Plug 'posva/vim-vue'
  " Plug 'sheerun/vim-polyglot'

call plug#end()

" Keybindings

" Set leader to spacebar
let mapleader = " "
" Cancel a search with leader+h:
nnoremap <silent> <leader>/ :nohlsearch<CR>
" Get out of terminal mode with escape:
" Write
nnoremap <silent> <leader>w :w<CR>

" Delete a buffer
nmap <silent> <leader>x  :bdelete<CR>

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

" Persistent undo:
set undofile
set undodir=~/.config/nvim/undo

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
set colorcolumn=80    " Add a mark at 80 characters

" Color config
set termguicolors
let g:gruvbox_italic = 1
let g:grubox_italicize_strings = 1
let g:gruvbox_undercurl = 0
colorscheme gruvbox

let g:vimspector_enable_mappings = 'HUMAN'

