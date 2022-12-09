call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'chriskempson/base16-vim'
" Plug 'danielwe/base16-vim'
" Plug 'altercation/vim-colors-solarized'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'itchyny/lightline.vim'
" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'elmcast/elm-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'miyakogi/conoline.vim'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'posva/vim-vue'
call plug#end()

syntax enable
set background=dark
" colorscheme solarized
colorscheme base16-monokai
filetype plugin on

" set clipboard=unnamed                     " Mac OS X clipboard sharing
set clipboard=unnamedplus

imap jk <ESC>
let mapleader=","                           " leader is ','
nnoremap <silent> <leader>n :FZF<cr>

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab

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
autocmd FileType go nmap <leader>t <Plug>(go-test)

let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

" let g:go_fmt_command = "gofmt"
" let g:go_fmt_options = {
"   \ 'gofmt': '-s',
"   \ }

let g:go_fmt_autosave = 1

" let g:go_metalinter_autosave = 1

let g:go_autodetect_gopath = 1

let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'vue': ['eslint'],
 \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
