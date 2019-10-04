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
  Plug 'reedes/vim-pencil'

  " Code Completion and linting:
  Plug 'w0rp/ale'                       " Async Linting
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Auto-stuff
  Plug 'jiangmiao/auto-pairs'           " Auto pair things like ( and {} )
  Plug 'tpope/vim-ragtag'               " Shortcut mappings for useful tags
  Plug 'alvan/vim-closetag'
  Plug 'junegunn/fzf.vim'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'rhysd/git-messenger.vim'

  " Ruby and rails:
  Plug 'tpope/vim-rails'
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-endwise'              " Closes ruby blocks
  Plug 'tpope/vim-rbenv'
  Plug 'tpope/vim-bundler'

  " Javascript and Frameworks
  Plug 'posva/vim-vue'

  " Markdown
  Plug 'gabrielelana/vim-markdown'
  Plug 'suan/vim-instant-markdown'

call plug#end()

" Keybindings
" Set leader to spacebar
let mapleader = " "
" Cancel a search with leader+h:
nnoremap <leader>/ :nohlsearch<CR>
" Toggle nerdtree with leader+t:
nnoremap <leader>t :NERDTreeToggle<CR>
" Escape insert mode with jj:
inoremap jj <esc>
" Get out of terminal mode with escape:
tnoremap <esc> <C-\><C-n>
" Next tab:
nnoremap <C-l> :tabnext<CR>
" Previous tab:
nnoremap <C-h> :tabprev<CR>
" Autoformat
nnoremap <leader>f :ALEFix<CR>
" Git status
nnoremap <leader>s :Gstatus<CR>
" Git commit
nnoremap <leader>c :Gcommit<CR>
" Goyo enable
nnoremap <silent> <leader>g :Goyo<CR>
" Limelight enable
nnoremap <silent> <leader>l :Limelight!!<CR>
" Write
nnoremap <leader>w :w<CR>

" Navigation
nnoremap <leader>Q :qa!<cr>
nnoremap <leader>j <c-d>
nnoremap <leader>k <c-u>

" Coc keybindings
" ctrl+space triggers completion
inoremap <silent><expr> <c-space> coc#refresh()
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf  <Plug>(coc-fix-current)
" Show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" ultisnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Input  behaviour
autocmd FileType * setlocal formatoptions=tcqnBj
set textwidth=80
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set complete+=kspell

" Engine settings
set hidden

" Persistent undo
set undofile
set undodir=~/.config/nvim/undo

" Yeah, yeah.
if has('mouse')
  set mouse=a
endif

" Indent Behavior
set autoindent
filetype on
filetype plugin on
filetype plugin indent on

" Display behavior
set splitright                                " open vertical splits on the right
set splitbelow                                " open the horizontal split below
set scrolloff=5                               " keep a 5 line padding when moving the cursor
set showmatch                                 " Shows matching parenthesis
set number                                    " Show current line number
set relativenumber                            " Show relative line numbers
" set hlsearch                                  " Highlight found words when searching
set foldmethod=manual                         " Disable auto-folding
set termguicolors
" Disable blank line tildes
set fcs=eob:\ 
set cmdheight=2

" Color Scheme config
" set background=dark
colorscheme base16-railscasts
let g:falcon_airline = 1

set cursorline

" Plugins

" FZF
nmap <silent> <C-p> :Files<cr>
nmap <silent> <leader>p :Rg<cr>
" nmap <silent> <leader>j :Lines<cr>
nmap <silent> <leader>b :Buffers<cr>

" ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_set_highlights = 0
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1

" NERDTree
let NERDTreeQuitOnOpen                         = 1               " Quit nerdtree when opening a file

" Airline
let g:airline_powerline_fonts                 = 1
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled      = 1               " Enable buffer & tab list at the top
let g:airline#extensions#tabline#show_splits  = 1               " Display open splits on a tab
let g:airline#extensions#tabline#fnamemod     = ':t'            " Show just the filename
let g:airline#extensions#tabline#show_buffers = 1               " Show buffers with a single tab
let g:airline_exclude_preview = 0 " Exclude preview windows
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ale#enabled = 1

" Ragtag
let g:ragtag_global_maps                      = 1

" Ignore node_modules (useful for ctrlp)
set wildignore+=*/node_modules/*

" Match tag always
let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'xhtml' : 1,
      \ 'xml' : 1,
      \ 'jinja' : 1,
      \ 'eruby' : 1,
      \ 'php' : 1,
      \ 'vue' : 1
      \}

" Ruby host
let g:ruby_host_prog = '/home/robert/.rbenv/versions/2.5.3/bin/neovim-ruby-host'

" vim-closetag
let g:closetag_filenames = '*.html, *.js, *.jsx, *.vue'

" Limelight
let g:limelight_conceal_guifg = '#444444'

" Goyo
let g:goyo_width = 81

function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  ALEDisable
  let g:ale_sign_column_always = 0
  set scrolloff=999
  " Limelight
  " ...
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  ALEEnable
  let g:ale_sign_column_always = 1
  set scrolloff=5
  " Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" markdown preview
let g:instant_markdown_autostart = 0
nnoremap <silent> <leader>m :InstantMarkdownPreview<cr>
