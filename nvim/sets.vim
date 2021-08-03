
syntax on

set mouse=a
set encoding=utf-8
set noerrorbells
set smartindent
set autoindent
set number
set relativenumber
set numberwidth=1
set nowrap

set expandtab ts=2 sw=2 ai
set scrolloff=8

set ignorecase
set hlsearch
set incsearch

set showmatch
set cursorline
set termguicolors
set hidden
set noshowmode

set foldmethod=syntax
autocmd BufWinEnter * silent! :%foldopen! " ~ https://stackoverflow.com/a/23672376

let mapleader = " "

"
" coc
" 
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

