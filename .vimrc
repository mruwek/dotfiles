"
" .vimrc
"

" Turn Vim super-powers on
set nocompatible
" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'matchit.zip'
Plugin 'python_match.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'freitass/todo.txt-vim'

call vundle#end()

" Enable loading filetype and indentation plugin
filetype plugin on
filetype indent on

" Turn syntax highlighting on
let base16colorspace="256"
set background=dark
colorscheme base16-summerfruit
syntax on

" Turn persistent undo function on
set undodir=~/.vim/undo
set undofile

" set lang to pl
set spelllang=pl

" load local .vimrc files
set exrc

"
" GLOBAL SETTINGS
"

" Search is case sensitive only if it is needed
set ignorecase
set smartcase

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Allow backspacing over everything
set backspace=indent,eol,start

" Insert mode completion options
set completeopt=menu,longest,preview

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Do not use spaces for <Tab>
set expandtab

" Remember up to 100 'colon' commmands and search patterns
set history=100

" Enable incremental search
set incsearch

" Always show status line, even for one window
set laststatus=2

" Strings to use in 'list' mode
set listchars=tab:>-,trail:-,eol:$

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Don't highlight results of a search
set nohlsearch

" List mode: false
set nolist

" Turn off numbers by default
set nonumber

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Use F10 to toggle 'paste' mode
set pastetoggle=<F10>

" Show line, column number, and relative position within a file in the status
" line
set ruler

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Use 4 spaces for (auto)indent
set shiftwidth=4

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Number of spaces that a <Tab> counts for while performing editing operations
set softtabstop=4

" Don't request terminal version string (for xterm)
set t_RV=

" Use 4 spaces for <Tab> and :retab
set tabstop=4

" Write swap file to disk after every 50 characters
set updatecount=50

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history 
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

"
" AUTOCOMMANDS
"

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Strip eventual BOM
au BufReadPost * setlocal nobomb

"
" MAPPINGS
"

" Set the <Leader> for combo commands
let mapleader = ","

" remap Latex-suite jump between placeholders
map <C-Space> <Plug>IMAP_JumpForward
map <C-@> <C-Space>
imap <C-S-Space> <Plug>IMAP_JumpForward
imap <C-@> <C-S-Space>

" Easy window split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Use CTRL-F for omni completion
imap <C-f> <C-o><C-x>

" Map CTRL-L to piece-wise copying of the line above the current one
imap <C-L> @@@<ESC>hhkywjl?@@@<CR>P/@@@<CR>3s

" Map ,f to display all lines with keyword under cursor and ask which one to
" jump to
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Use ,s to convert spaces after one-letter prepositions and conjunctions to
" nobreakable ones
nmap ,s J:%s:\(\_^\\|[ („]\)\([aAiIoOuUwWzZ]\) :\1\2<Char-0xa0>:g<CR>gqap

" Use <F6> to toggle line numbers
nmap <silent> <F6> :set number!<CR>

" Set tabs opening
map \t :tabnew<CR>
map \n :tabnext<CR>
map \p :tabprevious<CR>
map \c :tabclose<CR>

" Fast substitution
map ;; :%s:::g<Left><Left><Left>
map ;' :s:::g<Left><Left><Left>
map ;. :s:></:></:<Left><Left><Left>
map ;, :s:="":="":<Left><Left>

"
" Latex-suite part
"

" Set grep to always generate a file-name
set grepprg=grep\ -nH\ $*

" *.tex files are LaTeX files
let g:tex_flavor='latex'

" gVim doesn't run in term so it need some extra config
if has("gui_running")
    set go=aegiLt
    map  <silent>  <S-Insert>  "+p
    imap <silent>  <S-Insert>  <Esc>"+pa
    vmap <silent>  <C-Insert> "+y
    cmap <S-Insert>  <C-R>+
endif
