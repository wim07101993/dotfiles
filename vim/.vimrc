" BASIC SETTINGS --------------------------------------------------------- {{{

set guifont=Hack:h10:cANSI
set nocompatible
set background=dark
colorscheme solarized
"let g:solarized_termcolors=256

" enable filetype detection
filetype on
filetype plugin on
filetype indent on

" enable syntax highlighting
syntax on

" display line-numbers
set number

" cursor visibility
set cursorline

" use space instead of tab
set expandtab

" set indents to 4 spaces
set shiftwidth=4
set tabstop=4

" don't save backup files
set nobackup

" don't wrap lines
set nowrap

" show the current mode at bottom of screen
set showmode

" highlight search results
set hlsearch

set wildmenu
set wildmode=list:longest
set wildignore=*.pdf,*.png,*.jpg,*.gif,*.exe

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

    Plug 'dense-analysis/ale'
    Plug 'dart-lang/dart-vim-plugin'
    Plug 'preservim/nerdtree'
    Plug 'godlygeek/tabular'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'fatih/vim-go', { 'for': 'go', 'do': 'GoUpdateBinaries' }
    Plug 'natebosch/vim-lsc'
    Plug 'natebosch/vim-lsc-dart', { 'for': 'dart' }
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    Plug 'valloric/youcompleteme'

call plug#end()

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" enable code folding
augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" MAPINGS ---------------------------------------------------------------- {{{

" Set leader key
let mapleader = "\\"

nnoremap <leader>\ ``

" Type jj to exit inser mode
inoremap jj <Esc>

" Center the cursor vertically when moving to the next word during a search
nnoremap n nzz
nnoremap N Nzz

" Pressing ENTER adds a new line below the current line without going into
" inser mode
"nnoremap cr o<esc>
" Pressing SHIFT-ENTER adds a new line below the current one without going 
" into insert mode
nnoremap OM o<esc>

" Yank form cursor to the end of line
nnoremap Y y$

" Remap :split and :vsplit for splitting the window to CTRL+j, CTRL+k,...
nnoremap <c-j> :split<cr>
nnoremap <c-k> :vsplit<cr>
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Use ctrl-s to save the file
nnoremap <c-s> :w<cr>

" Nerdtree on F3
nnoremap <F3> :NERDTreeToggle<cr>
" ignore files in Nerdtree
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.png$', '\.pdf$', '\.gif$']
" show hidden files
let NERDTreeShowHidden=1

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" }}}

" Language server protocol" ----------------------------------------------- {{{

let g:lsc_auto_map = v:true
let g:dart_format_on_save = 1
let g:dart_style_guid = 2

" }}}
