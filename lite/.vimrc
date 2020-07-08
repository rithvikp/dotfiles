" This is a simple vimrc with only the basics. No additional installations are required.
" As a result, there are no plugins in this config.

set spell

" ----- START LANGUAGES -----
if has('autocmd')
    autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab   " Use tabs for Go files
    autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab   " Use tabs for Go files
    autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2   " Use 2 spaces for cpp files
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
    autocmd FileType typescript.tsx setlocal shiftwidth=2 tabstop=2 softtabstop=2   " Use 2 spaces for tsx files
    autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2       " Use 2 spaces for typescript files
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2       " Use 2 spaces for javascript files
    autocmd FileType dart setlocal shiftwidth=2 tabstop=2 softtabstop=2 " Use tab width of 2
    autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
endif
" ----- END LANGUAGES -----

" ----- START MAPPINGS -----
let mapleader = ","

nmap <leader>. :b#<Enter>
nnoremap <leader>w :w<Enter>
nmap <leader>r :reg<Enter>
" ----- END MAPPINGS -----

" Editor configuration with parts inspired by https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
" ----- START SEARCHING -----
" Single file search
set incsearch " Enable incremental searching
set hlsearch " Highlight searches
set ignorecase
set smartcase " Ignore case if all lowercase
runtime! macros/matchit.vim 	    	" % matches more than just single characters
" ----- END SEARCHING -----

" ----- START APPEARANCE -----
" Colors
colorscheme desert " Set colorscheme
hi MatchParen cterm=none ctermbg=yellow ctermfg=blue " Change matching brace color

" Status bar
set laststatus=2
set ruler
set wildmenu " Enable command autocompletion

" Syntax highlighting
if has('autocmd')
  filetype plugin indent on " Enable filetype specific features
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set shiftround " Line wrapping
set showmatch " Show matching parentheses
set complete-=i

" Disable line wrapping and configure overflow markers
set wrap
set display+=lastline

if !&scrolloff
  set scrolloff=1 " One line top and bottom buffer area
endif
set lazyredraw " Speed up viewing large files

set noerrorbells visualbell t_vb= " Remove beeping
" ----- END APPEARANCE -----

" ----- START EDITING -----
" Indentation and whitespace
set backspace=indent,eol,start " Ensure backspace always works
set smarttab
set autoindent
set copyindent
set expandtab " Use spaces
set tabstop=4 " Default of 4 spaces
set shiftwidth=4 " Default of 4 spaces
set smartindent

set cursorline " Line under cursor
" No line numbers are set
set textwidth=100 " Set wrapping length

set nrformats-=octal " Remove octal number incrementing

" History storage
set history=1000
set tabpagemax=50
set undolevels=1000
set undofile
set noswapfile

set encoding=utf-8
set autoread " Auto update files
" ----- END EDITING -----
