augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-* setfiletype mail
  " Wiki. For now we'll assume all files opened in the qutebrowser editor are wiki files.
  autocmd BufRead,BufNewFile *qutebrowser-editor-* setfiletype mediawiki
augroup END
