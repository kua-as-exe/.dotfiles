
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

