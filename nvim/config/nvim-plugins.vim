" Plug {
    " Basic Configation {
        call plug#begin('~/.local/share/nvim/plugged')
    " }

    " Install Plugin {

        " Browse
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
        Plug 'scrooloose/nerdtree'
        Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'bling/vim-airline'
        Plug 'valloric/matchtagalways'
        Plug 'tpope/vim-fugitive'
        Plug 'christoomey/vim-tmux-navigator'
        Plug 'benmills/vimux'

        " Syntax
        Plug 'pangloss/vim-javascript'
        Plug 'mxw/vim-jsx'
        Plug 'posva/vim-vue'
        Plug 'ekalinin/dockerfile.vim'
        Plug 'stanangeloff/php.vim'

        " Coding
        Plug 'w0rp/ale'
        Plug 'tpope/vim-surround'
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'


        " Color Scheme
        Plug 'altercation/vim-colors-solarized'

    " }

    call plug#end()
" }

