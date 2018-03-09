" ==================================================================================================
" General settings
" ==================================================================================================

" base
set nocompatible                      " vim, not vi
syntax on                             " syntax highlighting
filetype plugin indent on             " try to recognise filetype and load plugins and indent files

" set true colors and add vim specific fixes
set termguicolors

" interface
set background=dark                   " tell vim what the background color looks like
set colorcolumn=100                   " show a column at 100 chars
set cursorline                        " highlight current line
set noshowmode                        " don't show mode
set number                            " show line numbers
set relativenumber                    " show relative line numbers
set ruler                             " show current position at bottom
set scrolloff=5                       " keep at least 5 lines above/below
set shortmess+=aAIsT                  " disable welcome screen and other messages
set showcmd                           " show any commands
set sidescroll=1                      " smoother horizontal scrolling
set sidescrolloff=5                   " keep at least 5 lines left/right
set splitbelow                        " create new splits below
set splitright                        " create new splits to the right
set wildmenu                          " enable wildmenu
set wildmode=longest:full,full        " configure wildmenu
set nohidden                          " close buffers instead of hiding them

" whitespace
set expandtab                         " use spaces
set nojoinspaces                      " use one space, not two, after punctuation
set shiftround                        " shift to next tabstop
set shiftwidth=2                      " amount of space used for indentation
set softtabstop=2                     " appearance of tabs
set tabstop=2                         " use two spaces for tabs

" folding
set nofoldenable                      " disable folds

" text appearance
set synmaxcol=200                     " stop syntax highlighting after 200 columns
set nowrap                            " disable line wrapping

" interaction
set backspace=2                       " make backspace work like most other apps
set mouse=a                           " enable mouse support
set mousehide                         " hide the mouse cursor while typing
set whichwrap=b,s,h,l,<,>,[,]         " backspace and cursor keys wrap too

" searching
set hlsearch                          " highlight search matches
set ignorecase                        " set case insensitive searching
set incsearch                         " find as you type search
set smartcase                         " case sensitive searching when not all lowercase

" background processes
set autoread                          " update file when changed outside of vim
set autoindent                        " copy indentation from the previous line for new line
set clipboard=unnamed                 " use native clipboard
set history=200                       " store last 200 commands as history
set nobackup                          " don't save backups
set noerrorbells                      " no error bells please
set noswapfile                        " no swapfiles
set nowritebackup                     " don't save a backup while editing
set ttyfast                           " indicates a fast terminal connection

" character encoding
if !&readonly && &modifiable
  set fileencoding=utf-8              " the encoding written to file
endif
set encoding=utf-8                    " the encoding displayed

" ==================================================================================================
" Set cursorshape based on mode
" ==================================================================================================

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ==================================================================================================
" Keys
" ==================================================================================================

" set leader to space
let mapleader = " "

" map semicolon to colon and vice versa
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" adjust window size with arrow keys
noremap <right> <C-w>5>
noremap <left> <C-w>5<
noremap <up> <C-w>5+
noremap <down> <C-w>5-

" keep selection after indent
vnoremap < <gv
vnoremap > >gv

" reload vim config
nnoremap <leader>r :source $MYVIMRC<CR>

" sort
vnoremap <leader>s :sort<CR>

" clear search
nnoremap <leader>c :let @/ = ""<CR>

" select all
nnoremap <leader>a ggVG<CR>

" copy all
nnoremap <leader>y ggVGy<CR>

" upper or lowercase the current word
nnoremap <leader>^ gUiW
nnoremap <leader>v guiW

" cycle through changelist
nnoremap <leader>- g;
nnoremap <leader>= g,

" cycle through jumplist
nnoremap <leader>, <C-o>
nnoremap <leader>. <C-i>

" cycle through quickfix list
noremap <leader>[ :cprev<CR>
noremap <leader>] :cnext<CR>

" ==================================================================================================
" Plugins
" ==================================================================================================

call plug#begin()

" theme
Plug 'rakr/vim-one'

" syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'lepture/vim-jinja'
Plug 'valloric/matchtagalways'

" text manipulation
Plug 'alvan/vim-closetag'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'lifepillar/vim-mucomplete'
Plug 'svermeulen/vim-easyclip'

" movement
Plug 'Konfekt/vim-smartbraces'
Plug 'dietsche/vim-lastplace'
Plug 'easymotion/vim-easymotion'

" interface
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'szw/vim-maximizer'
Plug 'vim-airline/vim-airline'
Plug 'wesQ3/vim-windowswap'
Plug 'yggdroot/indentline'

" background
Plug 'w0rp/ale'

" el popo
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

call plug#end()

" ==================================================================================================
" Autocommands
" ==================================================================================================

augroup vimrcEx
  autocmd!

  " disable comment continuation
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  " hide hidden characters in nerdtree buffer
  autocmd FileType nerdtree setlocal nolist
augroup END

" ==================================================================================================
" Plugin settings
" ==================================================================================================

if has_key(g:plugs, 'vim-one')
  colorscheme one
  let g:airline_theme='one'
endif

if has_key(g:plugs, 'vim-polyglot')
  let g:vim_markdown_conceal = 0
endif

if has_key(g:plugs, 'vim-mucomplete')
  set completeopt=menuone,longest,noselect,noinsert
  set shortmess+=c
  let g:mucomplete#chains = { 'default': ['path', 'incl'] }
  let g:mucomplete#buffer_relative_paths = 1
endif

if has_key(g:plugs, 'ale')
  let g:ale_sign_error = '>>'
  let g:ale_sign_warning = '--'
endif

if has_key(g:plugs, 'editorconfig-vim')
  let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
endif

if has_key(g:plugs, 'nerdtree')
  let NERDTreeMapActivateNode='l'
  let NERDTreeMapCloseDir='h'
  let NERDTreeMinimalUI = 1
  let NERDTreeAutoDeleteBuffer = 1
  nnoremap <leader>n :NERDTreeToggle<CR>
endif

if has_key(g:plugs, 'vim-airline')
  let g:airline_powerline_fonts = 0
  let g:airline_left_sep=''
  let g:airline_left_alt_sep='|'
  let g:airline_right_sep=''
  let g:airline_right_alt_sep='|'
endif

if has_key(g:plugs, 'vim-easyclip')
  let g:EasyClipUseCutDefaults = 0
  nmap x <Plug>MoveMotionPlug
  xmap x <Plug>MoveMotionXPlug
  nmap xx <Plug>MoveMotionLinePlug
endif

if has_key(g:plugs, 'vim-easymotion')
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_keys='qwertyuiopasdfghjklzxcvbnm'
  map <leader> <Plug>(easymotion-prefix)
endif

if has_key(g:plugs, 'vim-gitgutter')
  set signcolumn=yes
  let g:gitgutter_sign_added = '++'
  let g:gitgutter_sign_modified = '~~'
  let g:gitgutter_sign_removed = '__'
  let g:gitgutter_sign_removed_first_line = '¯¯'
  let g:gitgutter_sign_modified_removed = '~_'
endif
