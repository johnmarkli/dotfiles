" John Li's .vimrc file
" Hopefully this will last me a lifetime of productivity and fun

" Set first to get rid of Vi compatibility
set nocompatible

" change mapleader from \ to ,
let mapleader = ","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


" Pathogen
filetype off " Pathogen needs to run before plugin indent on
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
filetype plugin indent on

" LOOK AND FEEL
"-------------------------------------------------
" The all important color scheme
if &t_Co >= 256 || has("gui_running")
   let g:solarized_termcolors=256
   let g:solarized_termtrans=1
   syntax enable
   set background=dark
   colorscheme solarized
endif

" SETTINGS
"-------------------------------------------------
" allow unwritten changes to a file and open a new one without being forced to write or undo
set hidden

" spacing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
set copyindent

" show tabs and spaces
"set list
"set listchars=tab:▸\ ,eol:cv

" wrapping
set wrap
set textwidth=90
set formatoptions=qrn1
" set colorcolumn=92

" search options
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" others
set ruler
set backspace=indent,eol,start
set number
set showmatch
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile

" set paste mode for dumb pasting
set pastetoggle=<F2>

" filetypes
filetype plugin indent on

" KEY REMAPS
"-------------------------------------------------
"for more natural movement between lines
nnoremap j gj
nnoremap k gk

" to clear highlight press , then /
nmap <silent> ,/ :nohlsearch<CR>

" for easier window splitting
nnoremap <leader>s <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" for plugins
nnoremap <leader>a :Ack 

" for NERDtree
let NERDTreeChristmasTree=0
let NERDTreeChDirMode=1
nmap <silent> <c-n> :NERDTreeToggle<CR>
" nnoremap <leader>n :NERDTree ~/<CR> <bar> :cd ~/<CR>
" nnoremap <leader>p :NERDTree ~/Documents/Razorback/Server<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set mouse=a

" Get rid of automatting comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
