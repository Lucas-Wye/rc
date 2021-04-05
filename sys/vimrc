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
" FOR Windows
" iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
" ni $HOME/vimfiles/autoload/plug.vim -Force
call plug#begin('~/vimfiles/plugged')
" FOR Linux
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'jceb/vim-orgmode'
Plug 'lervag/vimtex'
Plug 'lvht/mru'
call plug#end()

" FOR vimtex
let g:tex_flavor='latexmk'
let g:vimtex_texcount_custom_arg=' -ch -total'
au FileType tex map <buffer> <silent>  <leader>lw :VimtexCountWords!  <CR><CR>
" Path of SumatraPDF, For Windows
let g:Tex_ViewRule_pdf = '~\AppData\Local\SumatraPDF\SumatraPDF.exe -reuse-instance -inverse-search "gvim -c \":RemoteOpen +\%l \%f\""'
" For Linux
"let g:vimtex_view_method='zathura'
" show the compiler hint
let g:vimtex_quickfix_mode=1
" hide the last two lines
set conceallevel=1
let g:tex_conceal='abdmg'

" FOR mru
" set max lenght for the mru file list
let g:mru_file_list_size = 7 " default value
" set path pattens that should be ignored
let g:mru_ignore_patterns = 'fugitive\|\.git/\|\_^/tmp/' " default value

" FOR gVim
set guifont=Consolas:h12

" FOR Verilog
inoremap bev begin<CR>end<ESC>k$a
inoremap alv always<space>@<space>() begin<CR>end<ESC>k$b2hi
inoremap mov module<CR>endmodule<ESC>8hi
inoremap cav case()<CR>endcase<ESC>ki
