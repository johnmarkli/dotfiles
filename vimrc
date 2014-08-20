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
"------------------------------------------------------------------------------------


" My Bundles here:
"-------------------------------------

"Commands
NeoBundle 'tomtom/tcomment_vim' " makes commenting easier
NeoBundle 'godlygeek/tabular' " better alignment
NeoBundle 'rking/ag.vim' " faster text searching with the silver searcher
NeoBundle 'tpope/vim-fugitive' " add git support
NeoBundle 'airblade/vim-gitgutter' " show git status in gutter
NeoBundle 'scrooloose/syntastic'

"Language specific
NeoBundle 'reedes/vim-pencil' " Writing mode
NeoBundle 'fatih/vim-go'

"Code display
NeoBundle 'kien/ctrlp.vim' " better js support
NeoBundle 'nathanaelkane/vim-indent-guides' " indent guides

"Completion
NeoBundle 'tpope/vim-repeat' " proper repeating in vim
NeoBundle 'tpope/vim-surround' " add surround functionality
NeoBundle 'Raimondi/delimitMate' " auto-complete for quotes, parens, brackets, etc.

"Ruby/Rails specific
NeoBundle 'tpope/vim-rails' " add vim support
NeoBundle 'vim-ruby/vim-ruby' " add ruby support
NeoBundle 'tpope/vim-endwise' " auto add end in ruby

"JavaScript/HTML/CSS specific
NeoBundle 'pangloss/vim-javascript' "vim javascript syntax
NeoBundle 'othree/javascript-libraries-syntax.vim' " js syntax highlighting
NeoBundle 'othree/javascript-libraries-syntax.vim' " syntax highlighting for js libraries
NeoBundle 'mattn/emmet-vim' " easier HTML
NeoBundle 'burnettk/vim-angular' " add angular support

"Interface
NeoBundle 'tomasr/molokai' " molokai color theme
NeoBundle 'christoomey/vim-tmux-navigator' " allow better vim tmux navigation
" NeoBundle 'bling/vim-bufferline' " show buffers in bar
NeoBundle 'bling/vim-airline'
let g:airline_theme='molokai'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
let g:airline#extensions#tabline#enabled = 1

NeoBundle 'scrooloose/nerdtree' " file explorer
let NERDTreeChristmasTree=0
let NERDTreeChDirMode=1
let NERDTreeMinimalUI=1 " Disable bookmarks label, and hint about '?'
nmap <silent> <leader>f :NERDTreeFind<CR> " Display current file in the NERDTree on the left
nmap <silent> <c-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

NeoBundle 'junegunn/goyo.vim' " Distraction free writing mode
 
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
"------------------------------------------------------------------------------------
" The all important color scheme
if &t_Co >= 256 || has("gui_running")
  syntax enable
  colorscheme molokai
endif
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif
"------------------------------------------------------------------------------------



" SETTINGS
"------------------------------------------------------------------------------------
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
" hi CursorLine ctermbg=8 "8 = dark gray"

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
set number! " Turn off line numbering"
set pastetoggle=<F2> " set paste mode for dumb pasting

" Disable output, vcs, archive, rails, temp and backup files.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

" Get rid of automatting comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

filetype plugin indent on " filetypes

" CtrlP faster search
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" KEY REMAPS
"------------------------------------------------------------------------------------

" alternatives to esc
imap jk <ESC>
imap jj <ESC>

" change mapleader from \ to space
let mapleader = "\<Space>"

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nnoremap <Leader>w :w<CR>

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
nmap <silent> <leader>/ :nohlsearch<CR>

" for easier window splitting
nnoremap <leader>s <C-w>v<C-w>l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" more natural split
set splitbelow
set splitright

" resize splits by sane amount
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" for plugins
nnoremap <leader>a :Ack 

" enable mouse for scrolling and window resizing
set mouse=a

" show insert mode on status line
set laststatus=2
