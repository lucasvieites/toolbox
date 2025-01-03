"syntax enable
set nocp
set tabstop=2
set shiftwidth=2
nmap <C-N><C-N> :set invnumber

" Copiado de http://codigobajolupa.blogspot.com/2008/10/vim-el-ide-para-php-parte-2.html
" ------ Global Configuration ------
" Line Number
set number
" added from http://www.packtpub.com/article/customizing-your-vim-work-area
set numberwidth=3

" Autoindent
set autoindent

" Indent for PHP
set shiftwidth=2
"set softtabstop=2

" Syntax activate
syn on

" Type syntax
set syn=php

" Color
color desert
colorscheme gruvbox

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Allow backspacing over everything
set backspace=indent,eol,start

" Insert mode completion options
"set completeopt=menu,longest,preview

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Remember up to 100 'colon' commmands and search patterns
set history=100

" Enable incremental search
set incsearch

" Always show status line, even for one window
set laststatus=2

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Don't highlight results of a search
set nohlsearch

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Use F10 to toggle 'paste' mode
set pastetoggle=<F10>

" Show line, column number, and relative position within a file in the status line
set ruler

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Don't request terminal version string (for xterm)
set t_RV=

" Write swap file to disk after every 50 characters
set updatecount=50

" Remember things between sessions
" '20 - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20 - remember 20 items in command-line history
" % - remember the buffer list (if vim started without a file arg)
" n - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
" - on first <Tab>, when more than one match, list all matches and complete
" the longest common string
" - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" netRW: Open files in a split window
let g:netrw_browse_split = 1

" highlight current line
:set cursorline
":highlight CursorLine guibg=lightblue ctermbg=lightgray

set background=dark
" highlight cursor column
":set cursorcolumn

" Map Ctrl+PageUp and Ctrl PageDown to previous tab and next tab
map <C-PageUp> :tabp<Enter>
map <C-PageDown> :tabn<Enter>

