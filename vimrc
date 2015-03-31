
let mapleader = ","


if has("gui_mac") || has("gui_macvim")
  macmenu &File.New\ Tab     key=<Nop>
  nmap <leader>ff :FufFile **/<CR>
endif

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



" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

syntax on

filetype off
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugin

filetype plugin indent on

let g:ctrlp_max_depth = 15
let g:ctrlp_max_files = 100000
let g:ctrlp_working_path_mode = 'w'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/log/*,*/vendor/bundle,*/vendor/bower*,*/node_modules,*/coverage/*

set guifont=Monaco:h12
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly

"set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands

""" evil whitespace detection
nnoremap W :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:w<CR>
""""""""""" Kevin's hacks """"""""
" highlight current line
set cursorline
"""""
" Colors
"""""
set background=dark
colorscheme solarized
"""""
" STATUS LINE
"""""
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

"""""
" Fancy Windows
"""""
au VimEnter * set winheight=999
set winheight=50
"set winminheight=20
set winwidth=79

"""""
" Rename Current File
"""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

""""
" Moving around
""""

"""""
" Misc key maps
"""""
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Oh Britania!
map! ± ~
map! § `


"""""
" File types
"""""
au BufRead,BufNewFile *.ejs   setfiletype html

"""""
" CoffeeScript
"""""
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab tabstop=2 softtabstop=2
"""""
" Ruby
"""""
au BufNewFile,BufReadPost *.rb setl shiftwidth=2 expandtab tabstop=2 softtabstop=2

au BufReadPost *.jsx.erb set syntax=javascript


call pathogen#runtime_append_all_bundles()
