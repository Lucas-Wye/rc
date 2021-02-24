syntax on 
filetype on 
filetype indent on
filetype plugin on
filetype plugin indent on

set langmenu=en
let $LANG='en'
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030

set nocompatible

set number
set relativenumber
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

" auto complete
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

" mapping
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map rr :set splitright<CR>:vsplit<CR>
map rl :set nosplitright<CR>:vsplit<CR>
map ru :set splitbelow<CR>:split<CR>
map rd :set nosplitbelow<CR>:split<CR>

" https://github.com/junegunn/vim-plug
call plug#begin('~/vimfiles/plugged')
"call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'
Plug 'jceb/vim-orgmode'
call plug#end()

" for vimtex
let g:tex_flavor='latexmk'
"let g:vimtex_view_method='zathura'
" show the compiler hint
let g:vimtex_quickfix_mode=1
" hide the last two lines
set conceallevel=1
let g:tex_conceal='abdmg'

" for gVim
set guifont=Consolas:h12

" for Verilog
inoremap bev beginend<ESC>2hi
inoremap alv always @ ()<ESC>i
inoremap mov module<space>endmodule<ESC>8hi
