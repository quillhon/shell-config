" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" User interface
set scrolloff=7                     " set 7 lines to the curors - when moving vertical..
set cmdheight=2                     " the commandbar height
set backspace=eol,start,indent      " set backspace config
set magic                           " set magic on, for regular expressions
set showmode                        " indicates input or replace mode at bottom
set number                          " show line number
set mat=1000                        " how many tenths of a second to blink

" Wildmenu
" show completion in command mode
set wildmenu                    " turn on WiLd menu
set wildmode=list:longest,full	" comand <Tab> completion, list matches, then longest common part, then all.

" Search
set ignorecase                  " case insensitive searching
set hlsearch                    " Highlight search things
set incsearch                   " make search like instant search
set showmatch                   " show matching brackets when text indicator is over them

" Ruler
set ruler                                          " show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
set showcmd

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Formatting
set shiftwidth=4    " indent = 4 spaces
set smartindent
set autoindent      " indent at the same level of the previous line
set tabstop=4       " indentation for four columns
set smarttab
set expandtab       " change tab to spaces

" Line break and wrap
set linebreak       " line breaker when wrap
set wrap            " wrap lines
set textwidth=500   " max text in a line

" Turn backup off.
set nobackup
set nowb
set noswapfile

" Colors and Fonts
    syntax enable                       " enable syntax highlight

    if has('win32') || has('win64')
    else
        set shell=/bin/zsh
    endif

    set t_Co=256
    set background=dark                 " set a dark background
    colorscheme solarized               " load a colorscheme

    " Set encoding and default language
    set encoding=utf8
    try
        lang en_US
    catch
    endtry

    set ffs=unix,dos,mac                " default file types

    set term=screen-256color

" Comment
" Don't add the comment prefix when I hit enter or o/O on a comment line.
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

if has('mouse')
  set mouse=a
endif

