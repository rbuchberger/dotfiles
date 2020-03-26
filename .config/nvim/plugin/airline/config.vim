" Airline
let g:airline_powerline_fonts                   =  1
let g:airline_theme                             =  'base16_railscasts'
" Enable buffer & tab list at the top:
let g:airline#extensions#tabline#enabled        =  1
" Display open splits on a tab
let g:airline#extensions#tabline#show_splits    =  1
" Show just the filename:
let g:airline#extensions#tabline#fnamemod       =  ':t'
" Show buffers with a single tab
let g:airline#extensions#tabline#show_buffers   =  1
" Exclude preview windows
let g:airline_exclude_preview                   =  1
let g:airline#extensions#whitespace#enabled     =  0
let g:airline#parts#ffenc#skip_expected_string  =  'utf-8[unix]'
let g:airline#extensions#coc#enabled            =  1
