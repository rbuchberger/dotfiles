call plug#begin('~/.local/share/nvim/plugged')

  " UI
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ap/vim-css-color'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'Yggdroot/indentLine'

  " Color schemes
  Plug 'flazz/vim-colorschemes'

  " Text manipulation/convenience:
  Plug 'tpope/vim-surround'             " Awesome plugin for changing things like tags. Read the documentation.
  Plug 'godlygeek/tabular'              " It's why everything lines up so nicely
  Plug 'andrewradev/splitjoin.vim'      " Switch between oneline and multiline
  Plug 'tpope/vim-repeat'               " Dot repeat support for plugins
  Plug 'tyru/caw.vim'
  Plug 'Shougo/context_filetype.vim'    " Sets filetype by context. (Vue files)
  " Plug 'reedes/vim-pencil'

  " Code Completion and linting:
  " Plug 'w0rp/ale'                       " Async Linting
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
  " Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Auto-stuff
  Plug 'jiangmiao/auto-pairs'           " Auto pair things like ( and {} )
  Plug 'tpope/vim-ragtag'               " Shortcut mappings for useful tags
  Plug 'alvan/vim-closetag'
  Plug 'junegunn/fzf.vim'

  " Git
  Plug 'tpope/vim-fugitive'
  " Plug 'airblade/vim-gitgutter'
  Plug 'rhysd/git-messenger.vim'

  " Ruby and rails:
  Plug 'tpope/vim-rails'
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-endwise'              " Closes ruby blocks
  Plug 'tpope/vim-rbenv'
  Plug 'tpope/vim-bundler'

  " Javascript and Frameworks
  " Plug 'posva/vim-vue'

  " Syntax highlighting:
  " Plug 'sheerun/vim-polyglot'

  " Markdown
  Plug 'gabrielelana/vim-markdown'
  Plug 'suan/vim-instant-markdown'

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
" Git status
nnoremap <leader>s :Gstatus<CR>
" Git commit
nnoremap <leader>c :Gcommit<CR>
" Write
nnoremap <leader>w :w<CR>

" Input  behaviour
autocmd FileType * setlocal formatoptions=tcqnBj
set textwidth=80
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
set ignorecase
set smartcase
set complete+=kspell
set hidden

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
set foldmethod=manual  "  Disable auto-folding
set fcs=eob:\          "  Disable blank line tildes
set cmdheight=2        "  Double-height command window

" Color Scheme config
colorscheme base16-railscasts
let g:falcon_airline = 1
set termguicolors
set cursorline

" Ruby host
let g:ruby_host_prog = '/home/robert/.rbenv/versions/2.5.3/bin/neovim-ruby-host'
