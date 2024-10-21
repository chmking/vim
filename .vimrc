" Let CoC handle LSP
" This must be configured before the package is loaded by Plug
let g:ale_disable_lsp = 1

call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'mileszs/ack.vim'
" Plug 'miyakogi/conoline.vim'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

syntax enable
filetype plugin indent on

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8

if exists('$BASE16_THEME')
    \ && (!exists('g:colors_name')
    \ || g:colors_name != 'base16-$BASE16_THEME')
  let base16colorspace=256
  colorscheme base16-$BASE16_THEME
endif

filetype plugin on

" set clipboard=unnamed       " Mac OS X clipboard sharing
set clipboard=unnamedplus     " Linux climpboard sharing

imap jk <ESC>
let mapleader=","                           " leader is ','
nnoremap <silent> <leader>n :FZF<cr>

" Whitespace
set tabstop=4                               " number of visual spaces per TAB
set softtabstop=4                           " number of spaces per TAB when editing
set shiftwidth=4                            " set auto-indent to match tabstop
set expandtab                               " convert tabs to spaces

" File type overrides
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab

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

" Go config
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
" let g:go_metalinter_autosave = 1

" Go command mapping
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)

" Instant markdown
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

" Ag (Ack) config
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" Ale config
let g:ale_fixers = {
 \ 'css': ['prettier'],
 \ 'html': ['prettier'],
 \ 'javascript': ['prettier'],
 \ 'json': ['prettier'],
 \ 'liquid': ['prettier'],
 \ 'scss': ['prettier'],
 \ }

let g:ale_fix_on_save = 1

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 0

" Rust autofmt on save
let g:rustfmt_autosave = 1

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

au BufRead,BufNewFile *.njk setfiletype html
au BufRead,BufNewFile *.webc setfiletype html
