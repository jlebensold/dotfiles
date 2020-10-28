let mapleader = ","
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
"
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'vim-latex/vim-latex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Plug 'vim-syntastic/syntastic'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'micha/vim-colors-solarized'
" Plug 'tpope/vim-sensible'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'

call plug#end()

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips/' , 'Ultisnips']
let g:tex_flavor = 'latex'


set nowrap        " don't wrap lines
set backspace=indent,eol,start " allow backspacing over everything in insert mode

set expandtab
set ai sw=2
set tabstop=2
set shiftwidth=2

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile
set textwidth=80
set colorcolumn=100

syntax on

filetype off
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugin

filetype plugin indent on

let g:ctrlp_max_depth = 15
let g:ctrlp_max_files = 100000
let g:ctrlp_working_path_mode = 'w'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/log/*,*/vendor/bundle,*/vendor/bower*,*/node_modules,*/coverage/*,*/build/*,/assets/input/*,/assets/output/*

set guifont=Monaco:h12
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h

nnoremap <c-l> <c-w>l


""" rename """
""" nnoremap <leader>r :saveas<space>

""" evil whitespace detection
nnoremap W :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:w<CR>
"""""
" Fancy Windows
"""""
au VimEnter * set winheight=999
set winheight=50
"set winminheight=20
set winwidth=79

"""""
" Colors
"""""
set background=dark
colorscheme solarized
""""


if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
"let g:ycm_semantic_triggers['typescript'] = ['.']

