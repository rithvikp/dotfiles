" ----- SET UP PLUGINS -----
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

" Syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

" Autocomplete plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
" ----- END PLUGINS ------

" ----- START LANGUAGES -----
" Autocomplete setup
" Configure omnifunc to scroll through results on arrow keys and close when completion is chosen.
" This is probably an option that should be customized by the individual user.
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" https://stackoverflow.com/a/26022965/6708503
"inoremap <silent><expr> <Enter>
      "\ pumvisible() ? coc#_select_confirm() :
      "\ coc#expandableOrJumpable() ? \"\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      "\ <SID>check_back_space() ? \"\<Enter>" :
      "\ coc#refresh()

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"let g:coc_snippet_next = '<Tab>'

set completeopt-=preview " Don't show preview window
set omnifunc=syntaxcomplete#Complete " Ensure omnifunc is active
set pumheight=15 " Set max autocomplete window size

set spell

" Language/filetype shortcuts and settings
command! -nargs=0 OR :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Go
autocmd BufWritePre *.go :OR

" Java
autocmd FileType java let b:coc_root_patterns = ['.git', 'Makefile']

" Language specific autoformatting
if has('autocmd')
    autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab   " Use tabs for Go files
    autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2   " Use 2 spaces for cpp files
    autocmd FileType c setlocal shiftwidth=2 tabstop=2 softtabstop=2   " Use 2 spaces for c files
    autocmd FileType h setlocal shiftwidth=2 tabstop=2 softtabstop=2   " Use 2 spaces for h files
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
    autocmd FileType typescript.tsx setlocal shiftwidth=2 tabstop=2 softtabstop=2   " Use 2 spaces for tsx files
    autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2       " Use 2 spaces for typescript files
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2       " Use 2 spaces for javascript files
    autocmd FileType dart setlocal shiftwidth=2 tabstop=2 softtabstop=2 " Use tab width of 2
    autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType sql setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
endif
" ----- END LANGUAGES -----

" ----- START MAPPINGS -----
let mapleader = ","

nmap <leader>. :b#<Enter>
nnoremap <leader>w :w<Enter>
nmap <leader>n :NERDTreeToggle %<Enter>
nmap <leader>r :reg<Enter>
nmap <leader>f :Files<Enter>
nmap <leader>g :Rg<Enter>
nmap <leader>h :History<Enter>
nmap <leader>b :Buffers<Enter>

" Completion/lsp mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh <Plug>(coc-action)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" ----- END MAPPINGS -----

" Editor configuration with parts inspired by https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
" ----- START SEARCHING -----
" Single file search
set incsearch " Enable incremental searching
set hlsearch " Highlight searches
set ignorecase
set smartcase " Ignore case if all lowercase
runtime! macros/matchit.vim 	    	" % matches more than just single characters

" FZF
if executable('rg')
    " Set ripgrep functionality in fzf: default colors are changed and ripgrep is prevented from
    " matching file names (--delimiter...)
    command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1, { 'options': '--color hl:123,hl+:222 --delimiter : --nth 4..'}, 0)

    " Set ripgrep as the executable for :grep
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif
"let g:fzf_preview_window = ['down:40%:hidden', 'ctrl-/']
let g:fzf_layout = { 'down': '40%' }

" ----- END SEARCHING -----

" ----- START MISCELLANEOUS -----
" VCS diff setup
set updatetime=100
let g:signify_vcs_list=['git']

" File exploring
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
" ----- END MISCELLANEOUS -----

" ----- START APPEARANCE -----
" Colors
colorscheme gruvbox " Set colorscheme
set background=dark
hi MatchParen cterm=none ctermbg=yellow ctermfg=blue " Change matching brace color

" Status bar
let g:airline_powerline_fonts = 1 
let g:airline_theme = 'dark'
set laststatus=2
set ruler
set wildmenu " Enable command autocompletion
let g:airline_detect_spell=0

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

"set cursorline " Line under cursor - disabled for performance reasons
set number " Line numbers
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
