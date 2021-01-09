call plug#begin('~/.local/share/nvim/plugged')

  " UI
  Plug 'chriskempson/base16-vim'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-unimpaired'

  " Text manipulation:
  Plug 'Shougo/context_filetype.vim' " Sets filetype by context. (Vue files)
  Plug 'alvan/vim-closetag'
  Plug 'andrewradev/splitjoin.vim'
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-ragtag' " Shortcut mappings for useful tags
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tyru/caw.vim'

  " Code Completion and linting:
  Plug 'dense-analysis/ale'
  " Debugging
  " Plug 'vim-vdebug/vdebug' " Ruby, python, perl, and PHP, but convoluted setup.
  " Plug 'puremourning/vimspector'

  " Snippets
  Plug 'honza/vim-snippets'
  Plug 'SirVer/ultisnips'

  " Git
  Plug 'rhysd/git-messenger.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Language Specific
  Plug 'cespare/vim-toml'

  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-endwise' " Closes ruby blocks
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rbenv'
  Plug 'vim-ruby/vim-ruby'
  Plug 'chikamichi/mediawiki.vim'

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
nnoremap <leader>/ :nohlsearch<CR>
" Escape insert mode with jj:
inoremap jj <esc>
" Get out of terminal mode with escape:
tnoremap <esc> <C-\><C-n>
" Write
nnoremap <leader>w :w<CR>

" Input  behavior
autocmd FileType * setlocal formatoptions=njr
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
set updatetime=500

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
set relativenumber     "  Show relative line numbers
set fcs=eob:\          "  Disable blank line tildes

" Color Scheme config
colorscheme base16-railscasts
set termguicolors

" autocmd FileType * set conceallevel=0

" Ruby host
" let g:ruby_host_prog = '/home/robert/.rbenv/versions/2.5.3/bin/neovim-ruby-host'

let g:vimspector_enable_mappings = 'HUMAN'
