call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'itchyny/lightline.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
call plug#end()

" set background=dark
" colorscheme solarized
colorscheme base16-monokai

set clipboard=unnamed                       " Mac OS X clipboard sharing

imap jk <ESC>
let mapleader=","                           " leader is ','
nnoremap <silent> <leader>n :FZF<cr>

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Whitespace
set tabstop=4                               " number of visual spaces per TAB
set softtabstop=4                           " number of spaces per TAB when editing
set shiftwidth=4                            " set auto-indent to match tabstop
set expandtab                               " convert tabs to spaces

" Buffers
set hidden
set nobackup
set noswapfile
set nowritebackup
set autoread
set switchbuf=useopen
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
set splitbelow
set splitright
map <leader>v :vsplit<cr>

set cursorline                              " highlight current line

set incsearch                               " search as characters are entered
set hlsearch                                " highlight search matches

set autowrite                               " auto writes file contents on :make

nnoremap <leader><space> :nohlsearch<CR>    " turn off search highlight

set wildmenu                                " visual autocomplete for command menu
set lazyredraw                              " redraw only when needed
set showmatch                               " highlight matching [{()}]

set laststatus=2                            " always show the status line
set noshowmode                              " hide the default current mode display

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)

let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

