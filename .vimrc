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
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'python_match.vim'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'freitass/todo.txt-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Konfekt/FastFold'

call vundle#end()

" Colorscheme
let base16colorspace="256"
set background=dark
colorscheme base16-atelierseaside

" Turn on the powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set t_Co=256

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

" Insert mode completion options
set completeopt=menu,longest,preview

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Use 4 spaces for (auto)indent
set shiftwidth=4

" Number of spaces that a <Tab> counts for while performing editing operations
set softtabstop=4

" Use spaces for <Tab>
set expandtab

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Don't highlight results of a search
set nohlsearch

" List mode: false
set nolist

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" Don't request terminal version string (for xterm)
set t_RV=

" Write swap file to disk after every 50 characters
set updatecount=50

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Ignore tmp, lib, vcs, and build related files
set wildignore+=*/tmp/*,*.so,*.swp
let g:ctrlp_user_command = {
            \ 'types': {
              \ 1: ['.git', 'cd %s && git ls-files'],
              \ 2: ['.hg', 'hg --cwd %s locate -I .'],
              \ }
            \ }

" Don't use slow rope module as we use fast jedi-vim for same functionality
let g:pymode_rope = 0

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

" Use <C-n> to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Use gs for fugitive-Gstatus
map ,gs :Gstatus<CR>

" Use hs for Lawrencium-Hgstatus
map ,hs :Hgstatus<CR>

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
    set gfn=Dejavu\ Sans\ Mono\ for\ Powerline\ 11 
    map  <silent>  <S-Insert>  "+p
    imap <silent>  <S-Insert>  <Esc>"+pa
    vmap <silent>  <C-Insert> "+y
    cmap <S-Insert>  <C-R>+
endif
