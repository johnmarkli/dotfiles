" John Li's .vimrc file
" Hopefully this will last me a lifetime of productivity and fun

" Neo Bundle
"------------------------------------------------------------------------------------
" Turn off filetype plugins before bundles init
filetype off
" Auto installing NeoNeoBundle
let isNpmInstalled = executable("npm")
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
	if !isNpmInstalled
		echo "==============================================="
		echo "Your need to install npm to enable all features"
		echo "==============================================="
	endif
	echo "Installing NeoBundle.."
	silent !mkdir -p $HOME/.vim/bundle
	silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
	let iCanHazNeoBundle=0
endif

" Set up Neo Bundle
set nocompatible
if has('vim_starting')
	set nocompatible               " Be iMproved
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim' " Let NeoBundle manage NeoBundle

" My Bundles here:
"-------------------------------------
NeoBundle 'tomasr/molokai' " molokai color theme
NeoBundle 'sheerun/vim-polyglot' " support for multiple languages
NeoBundle 'tomtom/tcomment_vim' " makes commenting easier
NeoBundle 'tpope/vim-repeat' " proper repeating in vim
NeoBundle 'jelera/vim-javascript-syntax' " better js support
NeoBundle 'kien/ctrlp.vim' " better js support
NeoBundle 'Raimondi/delimitMate' " auto-complete for quotes, parens, brackets, etc.
NeoBundle 'othree/javascript-libraries-syntax.vim' " auto-complete for quotes, parens, brackets, etc.

NeoBundle 'scrooloose/nerdtree' " file explorer
let NERDTreeChristmasTree=0
let NERDTreeChDirMode=1
let NERDTreeMinimalUI=1 " Disable bookmarks label, and hint about '?'
nmap <silent> <leader>f :NERDTreeFind<CR> " Display current file in the NERDTree on the left
nmap <silent> <c-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

NeoBundle 'bling/vim-airline'
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
"-------------------------------------

" Installing bundles for the first time
if iCanHazNeoBundle == 0
	echo 'Installing Bundles, please ignore key map error messages'
	:NeoBundleInstall
	:so $MYVIMRC
endif

filetype plugin indent on " Enable Indent in plugins after updating runtime path by NeoBundle

NeoBundleCheck " Install bundles if not already installed
"------------------------------------------------------------------------------------


" LOOK AND FEEL
"-------------------------------------------------
" The all important color scheme
if &t_Co >= 256 || has("gui_running")
	syntax enable
	set background=dark
	colorscheme molokai
endif
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
	set t_Co=16
endif

" SETTINGS
"-------------------------------------------------
set hidden " set buffers instead of asking if to save them

" spacing
set tabstop=2
set shiftwidth=2
set expandtab " replace tabs with spaces
set smarttab " use 'shiftwidth' when using tab in front of a line
set autoindent " Autoindent when starting new line, or using `o` or `O`.
set copyindent
set shiftround " Round number of spaces to indent

set cursorline " highlight line that cursor is on

" wrapping
set wrap
set textwidth=90
set formatoptions=qrn1

" search options
set hlsearch " highlight search
set incsearch " highlight incrementally when searching
set showmatch " show matching brackets
set ignorecase " ignore case in search
set smartcase " don't ignore case when search has capital letter

" others
set ruler " show line and column number of current cursor position
set backspace=indent,eol,start " allow backspace to remove indents, newlines, etc.
set number " show line number
set title " set window title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set fileformats+=mac " Support all kind of EOLs by default.
set shortmess+=I " Don't display the intro message on starting Vim.

" set paste mode for dumb pasting
set pastetoggle=<F2>

" Disable output, vcs, archive, rails, temp and backup files.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

" Get rid of automatting comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" filetypes
filetype plugin indent on

" KEY REMAPS
"-------------------------------------------------

" change mapleader from \ to space
let mapleader = "\<Space>"

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>p :CtrlP<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"for more natural movement between lines
nnoremap j gj
nnoremap k gk

" to clear highlight press , then /
nmap <silent> ,/ :nohlsearch<CR>

" for easier window splitting
nnoremap <leader>s <C-w>v<C-w>l
nnoremap <T-h> <C-w>h
nnoremap <T-j> <C-w>j
nnoremap <T-k> <C-w>k
nnoremap <T-l> <C-w>l

" for plugins
nnoremap <leader>a :Ack 


set mouse=a " enable mouse for scrolling and window resizing


" tslime mappings
"let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" show insert mode on status line
" first, enable status line always
set laststatus=2

" " now set it up to change the status line based on mode
" " highlight the status bar when in insert mode
" if version >= 700
" 	au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
" 	au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
" endif
