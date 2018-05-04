execute pathogen#infect()

" disable vi compatibility
set nocompatible

" syntax highlighting
syntax enable
" show line numbers
set number
" show current line and cursor position
set ruler

" color scheme
colorscheme monokai

" commands to remember
set history=5000

" tabs are spaces
set expandtab
" spaces inserted per <tab>
set softtabstop=4
" visual spaces per <tab>
set tabstop=4
" copy previous line's indentation to new line
set autoindent

" show partially complete commands
set showcmd
" command <tab> completion
set wildmode=list:longest,full
set wildmenu

" search is case-sensitive with upper-case characters
set ignorecase smartcase
" search as characters are entered
set incsearch
" highlight matches
" use ':noh' to turn off highlighting until next search
set hlsearch

" indent if at start of line, else do word completion
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" status line
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" remap <leader>
let mapleader=","
