" -- SET UP PLUGINS --
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'

" Autocomplete plugin
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }

" Plugins for Go
Plug 'fatih/vim-go'

" File explorer plugins
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Commenting
Plug 'scrooloose/nerdcommenter'
" Text work
Plug 'tpope/vim-surround'
" Git 
Plug 'mhinz/vim-signify'

" Initialize plugin system
call plug#end()
" -- END PLUGINS --

" Searching
if executable('rg')
    " Set ripgrep functionality in fzf: default colors are changed and ripgrep is prevented from
    " matching file names (--delimiter...)
    command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1, { 'options': '--color hl:123,hl+:222 --delimiter : --nth 4..'}, 0)

    " Set ripgrep as the executable for :grep
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif

" Autocomplete setup
let g:ycm_semantic_triggers = { 'python,go,javascript,typescript,c,java,cpp,rust': [ 're!\w{2}' ]}
set pumheight=15                        " Set max autocomplete window size
let g:ycm_global_ycm_extra_conf = '$HOME/.config/nvim/.ycm_extra_conf.py'

" https://stackoverflow.com/a/26022965/6708503
if has('autocmd')
    autocmd CompleteDone * pclose       " Automatically close autocomplete window
endif

" Don't show preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
" Ensure omnifunc is active
set omnifunc=syntaxcomplete#Complete

" VCS diff setup
set updatetime=100
let g:signify_vcs_list=['git']

" Language/filetype shortcuts and settings
" Go
let g:go_fmt_command = "gopls"
let g:go_fmt_fail_silently = 1

" Language specific autoformatting
if has('autocmd')
    autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab   " Use tabs for Go files
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
    autocmd FileType dart setlocal shiftwidth=2 tabstop=2 softtabstop=2 " Use tab width of 2
    autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
endif

" File exploring
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

" Editor configuration with parts inspired by https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
let mapleader = ","

" Mappings
nmap <leader>. :b#<Enter>
nnoremap <leader>w :w<Enter>
nmap <leader>p :Files<Enter>
nmap <leader>q :q
nmap <leader>n :NERDTreeToggle %<Enter>
nmap <leader>r :reg<Enter>
nmap <leader>g :Rg<Enter>

if has('autocmd')
  filetype plugin indent on             " Enable filetype specific features
endif

" Syntax highlighting
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

colorscheme desert                      " Set colorscheme

set shiftround                          " Line wrapping
set showmatch	            			" Show matching parentheses
set complete-=i

" Indentation and whitespace
set backspace=indent,eol,start 	    	" Ensure backspace always works
set smarttab
set autoindent
set copyindent
set expandtab			            	" Use spaces
set tabstop=4			            	" Default of 4 spaces
set shiftwidth=4                        " Default of 4 spaces
set smartindent

set cursorline			            	" Line under cursor
set number			                	" Line numbers
set textwidth=100                       " Set wrapping length

set nrformats-=octal 	        		" Remove octal number incrementing

set incsearch			            	" Enable incremental searching
set hlsearch			            	" Highlight searches
set ignorecase
set smartcase			            	" Ignore case if all lowercase

" Setup bottom bar
set laststatus=2
set ruler
set wildmenu                            " Enable command autocomplete window

" Setup line viewing in pages
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline
set lazyredraw                          " Speed up viewing large files

set encoding=utf-8

set noerrorbells visualbell t_vb=   	" Remove beeping

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

set autoread			            	" Auto update files

" History storage
set history=1000
set tabpagemax=50
set undolevels=1000
set undofile
set noswapfile

" Fonts and Colors
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Change matching brace color
hi MatchParen cterm=none ctermbg=yellow ctermfg=blue

runtime! macros/matchit.vim 	    	" % matches more than just single characters
