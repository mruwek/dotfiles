"
" .vimrc
"

" Turn Vim super-powers on
set nocompatible

call plug#begin()
" core plugins
Plug 'romainl/Apprentice'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
" enhancing builtin functionality
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-speeddating'
" general purpose
Plug 'Konfekt/FastFold'
Plug 'godlygeek/tabular'
Plug 'milkypostman/vim-togglelist'
" vcs related
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'mhinz/vim-signify'
" pandoc
Plug 'vim-pandoc/vim-pandoc', { 'for': ['markdown', 'pandoc'] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': ['markdown', 'pandoc'] }
" todo.txt
Plug 'freitass/todo.txt-vim'
" python
Plug 'python-mode/python-mode', { 'branch':'develop', 'for': 'python' }
Plug 'vim-scripts/python_match.vim', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
call plug#end()

" Colorscheme
colorscheme apprentice

" Turn persistent undo function on
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
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

" Show the cursorline
set cursorline

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
set wildignore+=*.so,*.swp
let g:ctrlp_user_command = {
            \ 'types': {
              \ 1: ['.git', 'cd %s && git ls-files'],
              \ 2: ['.hg', 'hg --cwd %s locate -I .'],
              \ }
            \ }

"
" AUTOCOMMANDS
"

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Strip eventual BOM
au BufReadPost * setlocal nobomb

" Load quicklists into cwindow after grepping
au QuickFixCmdPost *grep* cwindow

" Delete fugitve buffers after leaving them
au BufReadPost fugitive://* set bufhidden=delete

"
" PYTHON
"

" Don't use slow rope module as we use fast jedi-vim for same functionality
let g:pymode_rope = 0

" force python3 in python plugins
let g:jedi#force_py_version = 3
let g:pymode_python = 'python3'

"
" LATEX-SUITE
"

" Set grep to always generate a file-name
set grepprg=grep\ -nH\ $*

" *.tex files are LaTeX files
let g:tex_flavor='latex'

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

" Map CTRL-L to piece-wise copying of the line above the current one
imap <C-L> @@@<ESC>hhkywjl?@@@<CR>P/@@@<CR>3s

" Map ,f to display all lines with keyword under cursor and ask which one to
" jump to
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Use ,s to convert spaces after one-letter prepositions and conjunctions to
" nobreakable ones
nmap ,s J:%s:\(\_^\\|[ („]\)\([aAiIoOuUwWzZ]\) :\1\2<Char-0xa0>:g<CR>gqap

" Use gs for fugitive-Gstatus
map ,gs :Gstatus<CR>

" Use hs for Lawrencium-Hgstatus
map ,hs :Hgstatus<CR>

" map for fugitive-Glog
map ,gl :Glog<CR>

" Tabularize maps
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>t :Tabularize /\|<CR>

" Fast substitution
map ;; :%s:::g<Left><Left><Left>
map ;' :s:::g<Left><Left><Left>
map ;. :s:></:></:<Left><Left><Left>
map ;, :s:="":="":<Left><Left>

"
" GVIM
"

if has("gui_running")
    set go=aegiLt
    set gfn=Dejavu\ Sans\ Mono\ for\ Powerline\ 11 
    map  <silent>  <S-Insert>  "+p
    imap <silent>  <S-Insert>  <Esc>"+pa
    vmap <silent>  <C-Insert> "+y
    cmap <S-Insert>  <C-R>+
endif
