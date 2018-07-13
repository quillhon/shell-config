let $VIMPATH = $HOME.'/.config/nvim'
let $VARPATH = '~/.cache'

let g:mapleader=','

" be iMproved
set nocompatible

" Function to source only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }

if has('nvim')
    call SourceIfExists($VIMPATH.'/config/nvim-plugins.vim')
else
    call SourceIfExists($VIMPATH.'/config/vim-plugins.vim')
endif

augroup MyAutoCmd
    autocmd!
augroup END

call SourceIfExists($VIMPATH.'/config/general.vim')
call SourceIfExists($VIMPATH.'/config/mappings.vim')
call SourceIfExists($VIMPATH.'/config/theme.vim')
