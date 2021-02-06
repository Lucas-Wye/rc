syntax on 
filetype on 
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8

set nocompatible

set number
set norelativenumber
set history=100 

set cursorline
set wrap
set showcmd
set wildmenu

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4

set showmatch

set vb t_vb=

set ruler

" search
set nohls
set incsearch
set ignorecase
set smartcase

" mapping
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source ~/.vimrc<CR>
map rr :set splitright<CR>:vsplit<CR>
map rl :set nosplitright<CR>:vsplit<CR>
map ru :set splitbelow<CR>:split<CR>
map rd :set nosplitbelow<CR>:split<CR>

" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
"Plug 'lervag/vimtex'

call plug#end()


" FOR vimtex
"let g:tex_flavor='latexmk'
"let g:vimtex_view_method='zathura'

" show the compiler hint
"let g:vimtex_quickfix_mode=1

" hide the last two lines
"set conceallevel=1
"let g:tex_conceal='abdmg'
