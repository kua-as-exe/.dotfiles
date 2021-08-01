" 
" Personal Nvim Configuration
" ~ Jorge Arreola
"
call plug#begin('~/.local/share/nvim/plugged')

" THEME
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'

" Core Plugins
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Util Plugins
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
Plug 'tpope/vim-commentary'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'wakatime/vim-wakatime'
Plug 'dhruvasagar/vim-open-url'

call plug#end()

source nvim/theme.vim
source nvim/sets.vim
source nvim/clipboard.vim
source nvim/terminal.vim

source nvim/lightline.vim
source nvim/nerdtree.vim

source nvim/utils.vim
source nvim/keys.vim


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" RESOURCES
"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" Useful links:
" ~ https://stackoverflow.com/a/28279006 // 
"   > You can jump to a mark by typing '<mark>, so '. will take you to the place of the last edit, '' will take you back to where you were, and '" takes you to the position you saved the file at.
" ~ https://dalibornasevic.com/posts/43-12-vim-tips
"
"   * 5. Delete in insert mode
"   To delete a character, word or line while in Insert mode, Vim Command Line mode or Shell Command Line  we have the following shortcuts available:
"   <C-h> " delete back one character (backspace)
"   <C-w> " delete back one word
"   <C-u> " delete back to start of line
"   <C-k> " delete forward to end of line

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

