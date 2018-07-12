let $VARPATH = '~/.cache'

" Function to source only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }

" be iMproved
set nocompatible

if has('nvim')
    call SourceIfExists('./config/nvim-plugins.vim')
else
    call SourceIfExists('./config/vim-plugins.vim')
endif

call SourceIfExists('./config/general.vim')
