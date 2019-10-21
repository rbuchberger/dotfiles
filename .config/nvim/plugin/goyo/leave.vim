function s:goyo_leave()
  set showmode
  set showcmd
  ALEEnable
  let g:ale_sign_column_always = 1
  set scrolloff=5
  " Limelight!
  " ...
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()
