" *Use <leader> key to toggle plugins*

" vimux {
    nnoremap <leader>vp :VimuxPromptCommand<cr>
" }

" fzf {
    nmap <leader>f :Files<cr>
    nmap <leader>b :Buffers<cr>
" }

" NERD Tree {
    let NERDTreeIgnore=['\.pyc$']
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1

    map <leader>n :NERDTreeToggle<cr>
    cno $nb NERDTreeFromBookmark
" }

" airline {
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'

    let g:airline_powerline_fonts = 1
" }

" vim-javascript {
    let g:javascript_plugin_flow = 1
" }

" vim-jsx {
    let g:jsx_ext_required = 0
" }

" vim-vue {
    autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

    au FileType vue.html.javascript.css set shiftwidth=2
    au FileType vue.html.javascript.css set tabstop=2
" }

" ale {
    let g:ale_lint_on_save = 1
    let g:ale_lint_on_text_changed = 0

    let g:airline#extensions#ale#enabled = 1
" }
