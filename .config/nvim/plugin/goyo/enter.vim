function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  ALEDisable
  let g:ale_sign_column_always = 0
  set scrolloff=999
  " Limelight
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
