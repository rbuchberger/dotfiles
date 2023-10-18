scriptencoding utf-8

" recommended by nvim-tree to avoid race conditions
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

call plug#begin('~/.local/share/nvim/plugged')

  " Appearance
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'romgrk/barbar.nvim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'sainnhe/gruvbox-material'
  Plug 'sindrets/winshift.nvim'
  Plug 'luukvbaal/stabilize.nvim'
  Plug 'sunjon/Shade.nvim'
  Plug 'goolord/alpha-nvim'
  Plug 'anuvyklack/pretty-fold.nvim'
  " Pair highlighting:
  Plug 'utilyre/sentiment.nvim'
  " Tailwind & hex code colors:
  Plug 'NvChad/nvim-colorizer.lua'

  " Keys
  Plug 'tpope/vim-unimpaired'
  Plug 'sudormrfbin/cheatsheet.nvim'

  " File opening & Finding
  Plug 'nvim-lua/popup.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'antosha417/nvim-lsp-file-operations'

  " Telescope
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope-ui-select.nvim'
  Plug 'crispgm/telescope-heading.nvim'
  Plug 'fhill2/telescope-ultisnips.nvim'
  Plug 'debugloop/telescope-undo.nvim'
  " Plug 'danielvolchek/tailiscope.nvim' " Doesn't work. Keep an eye on it.
  Plug 'stevearc/aerial.nvim'

  " Text manipulation:
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-repeat'
  Plug 'kylechui/nvim-surround'
  Plug 'numToStr/Comment.nvim'
  Plug 'godlygeek/tabular'
  " splitjoin:
  Plug 'Wansmer/treesj'
  Plug 'Wansmer/sibling-swap.nvim'
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
  Plug 'rmagatti/goto-preview'
  Plug 'RishabhRD/popfix'
  Plug 'github/copilot.vim'

  " Completion
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-calc'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
  Plug 'hrsh7th/cmp-nvim-lua', { 'for': [ 'lua', 'vim' ] }
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'dmitmel/cmp-cmdline-history'
  Plug 'lukas-reineke/cmp-rg'
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'
  Plug 'ray-x/cmp-treesitter'
  Plug 'roobert/tailwindcss-colorizer-cmp.nvim'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'rhysd/git-messenger.vim'
  Plug 'airblade/vim-gitgutter'

  " Language Specific
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  Plug 'chikamichi/mediawiki.vim', { 'for': 'mediawiki' }
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx', 'javascriptreact']}
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'isobit/vim-caddyfile', { 'for': 'caddyfile' }
  " the following plugin is archived, but it works. Testing replacements.
  " Plug 'jose-elias-alvarez/typescript.nvim', { 'for': ['typescript', 'tsx', 'typescriptreact']}
  Plug 'pmizio/typescript-tools.nvim', { 'for': ['typescript', 'tsx', 'typescriptreact']}
  Plug 'napmn/react-extract.nvim', { 'for' : ['tsx', 'typescriptreact', 'javascriptreact']}

call plug#end()

lua vim.loader.enable()

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
  autocmd FileType * setlocal formatoptions=qnjlc
augroup END

augroup terminal
  autocmd TermOpen * set filetype=terminal
augroup END

set signcolumn=yes
set cursorline
set textwidth=80
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
set ignorecase
set smartcase
set autoread
set undofile
set undodir=~/.local/share/nvim/undo
set updatetime=150
set completeopt=menuone,noselect
set nowrap

set foldopen&
" set foldclose=all
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=8

" eol:¬
set list listchars=trail:·
set splitright
set splitbelow
set scrolloff=5
set showmatch
set number
set fillchars=eob:\
set colorcolumn=81

set termguicolors

if globpath(&runtimepath, 'colors/gruvbox-material.vim') !=? ''
  let g:gruvbox_material_ui_contrast='high' " low, high
  " let g:gruvbox_material_transparent_background=1
  let g:gruvbox_material_better_performance=1
  let g:gruvbox_material_show_eob=0
  let g:gruvbox_material_palette='original' " original, mix, or material.

  colorscheme gruvbox-material
else
  colorscheme slate
end

" Highlight trailin " Pair highlightingg whitespace
match WarningMsg '\s\+$'
