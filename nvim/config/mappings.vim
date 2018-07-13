
" Key-mappings
"---------------------------------------------------------

" Non-standard {{{
" ------------

" Window-control prefix
nnoremap  [Window]   <nop>
nmap      s [Window]

" Fix keybind name for Ctrl+Spacebar
map <nul> <c-space>
map! <nul> <c-space>

" Use Ctrl+<Arrow> to resize splits
nnoremap <c-up>    :resize +2<cr>
nnoremap <c-down>  :resize -2<cr>
nnoremap <c-left>  :vertical resize +2<cr>
nnoremap <c-right> :vertical resize -2<cr>

" Use the left&right arrows switch buffer
nnoremap <right> :bn<cr>
nnoremap <left> :bp<cr>

nnoremap <leader>a =ip

" Toggle fold
nnoremap <cr> za

" Focus the current fold by closing all others
nnoremap <s-return> zMza

" Use backspace key for matchit.vim
nmap <bs> %
xmap <bs> %

nmap <tab>  <c-w>w
nmap <s-tab>  <c-w>W

"}}}
" Global niceties {{{
" ---------------

" Start an external command with a single bang
nnoremap ! :!

" Allow misspellings
cnoreabbrev qw wq
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd

" Start new line from any cursor position
inoremap <s-return> <c-o>o

" Quick substitute within selected area
xnoremap s :s//g<left><left>

nnoremap zl z5l
nnoremap zh z5h

" Select blocks after indenting
xnoremap < <gv
xnoremap > >gv|

" Use tab for indenting in visual mode
vnoremap <tab> >gv|
vnoremap <s-tab> <gv
nnoremap > >>_
nnoremap < <<_

" Navigation in command line
cnoremap <c-h> <home>
cnoremap <c-l> <end>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <c-d> <c-w>

" }}}
" File operations {{{
" ---------------

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :lcd %:p:h<cr>:pwd<cr>

" Fast saving
nnoremap <silent><leader>w :write<cr>
vnoremap <silent><leader>w <esc>:write<cr>
nnoremap <silent><c-s> :<c-u>write<cr>
vnoremap <silent><c-s> :<c-u>write<cr>
cnoremap <silent><c-s> <c-u>write<cr>

" Save a file with sudo
" http://forrst.com/posts/Use_w_to_sudo_write_a_file_with_Vim-uAN
cmap W!! w !sudo tee % >/dev/null

" }}}
" Editor UI {{{
" ---------

" I like to :quit with 'q', shrug.
nnoremap <silent> q :<c-u>:quit<cr>
autocmd MyAutoCmd FileType man nnoremap <silent><buffer> q :<C-u>:quit<cr>

" Show highlight names under cursor
nmap <silent> gh :echo 'hi<'.synIDattr(synID(line('.'), col('.'), 1), 'name')
	\.'> trans<'.synIDattr(synID(line('.'), col('.'), 0), 'name').'> lo<'
	\.synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name').'>'<cr>

" Toggle editor visuals
nmap <silent> <leader>ts :setlocal spell!<cr>
nmap <silent> <leader>tn :setlocal nonumber!<cr>
nmap <silent> <leader>tl :setlocal nolist!<cr>
nmap <silent> <leader>th :nohlsearch<cr>
nmap <silent> <leader>tw :setlocal wrap! breakindent!<cr>

" Tabs
nnoremap <silent> g0 :<C-u>tabfirst<cr>
nnoremap <silent> g$ :<C-u>tablast<cr>
nnoremap <silent> gr :<C-u>tabprevious<cr>
nnoremap <silent> <A-j> :<C-U>tabnext<cr>
nnoremap <silent> <A-k> :<C-U>tabprevious<cr>
nnoremap <silent> <C-Tab> :<C-U>tabnext<cr>
nnoremap <silent> <C-S-Tab> :<C-U>tabprevious<cr>
" Uses g:lasttab set on TabLeave in MyAutoCmd
let g:lasttab = 1
nmap <silent> \\ :execute 'tabn '.g:lasttab<cr>


" }}}
" Totally Custom {{{
" --------------

" Remove spaces at the end of lines
nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<cr>

" C-r: Easier search and replace
xnoremap <C-r> :<C-u>call <SID>get_selection('/')<cr>:%s/\V<C-R>=@/<cr>//gc<Left><Left><Left>

" Returns visually selected text
function! s:get_selection(cmdtype) "{{{
	let temp = @s
	normal! gv"sy
	let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
	let @s = temp
endfunction "}}}

" Location list movement
nmap <Leader>j :lnext<cr>
nmap <Leader>k :lprev<cr>

" Duplicate lines
nnoremap <Leader>d m`YP``
vnoremap <Leader>d YPgv

" Source line and selection in vim
vnoremap <Leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <Leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" Yank buffer's absolute path to X11 clipboard
nnoremap <Leader>y :let @+=expand("%")<cr>:echo 'Relative path copied to clipboard.'<cr>
nnoremap <Leader>Y :let @+=expand("%:p")<cr>:echo 'Absolute path copied to clipboard.'<cr>

" Drag current line/s vertically and auto-indent
vnoremap mk :m-2<cr>gv=gv
vnoremap mj :m'>+<cr>gv=gv
noremap  mk :m-2<cr>
noremap  mj :m+<cr>

" Session management shortcuts
nmap <silent> <leader>se :<c-u>execute 'SessionSave' fnamemodify(resolve(getcwd()), ':p:gs?/?_?')<cr>
nmap <silent> <leader>os :<c-u>execute 'source '.g:session_directory.'/'.fnamemodify(resolve(getcwd()), ':p:gs?/?_?').'.vim'<cr>

" }}}

" Display diff from last save {{{
command! DiffOrig vert new | setlocal bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
" }}}

" Append modeline to EOF {{{
nnoremap <silent> <Leader>ml :call <SID>append_modeline()<cr>

" Append modeline after last line in buffer
" See: http://vim.wikia.com/wiki/Modeline_magic
function! s:append_modeline() "{{{
	let l:modeline = printf(' vim: set ts=%d sw=%d tw=%d %set :',
				\ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
	let l:modeline = substitute(&commentstring, '%s', l:modeline, '')
	call append(line('$'), l:modeline)
endfunction "}}}
" }}}

" s: Windows and buffers {{{

nnoremap <silent> [Window]v  :<c-u>split<cr>
nnoremap <silent> [Window]g  :<c-u>vsplit<cr>
nnoremap <silent> [Window]t  :tabnew<cr>
nnoremap <silent> [Window]o  :<c-u>only<cr>
nnoremap <silent> [Window]b  :b#<cr>
nnoremap <silent> [Window]c  :close<cr>

" Smart way to move between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" vim: set ts=4 sw=4 tw=80 noet :
