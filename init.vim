" 
" Personal Nvim Configuration
" ~ Jorge Arreola
"
call plug#begin('~/.local/share/nvim/plugged')

" THEME
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'folke/twilight.nvim'
Plug 'Yggdroot/indentLine'

" Core Plugins
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'

" Util Plugins
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
Plug 'tpope/vim-commentary'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'wakatime/vim-wakatime'
Plug 'dhruvasagar/vim-open-url'
Plug 'tpope/vim-repeat' 
Plug 'AckslD/nvim-neoclip.lua'
Plug 'z3t0/arduvim'

" Coc
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'neoclide/jsonc.vim'
Plug 'mattn/emmet-vim'

Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'maxmellon/vim-jsx-pretty'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-telescope/telescope-symbols.nvim'

" LSP

Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

call plug#end()

source ~/.dotfiles/nvim/theme.vim
source ~/.dotfiles/nvim/sets.vim
source ~/.dotfiles/nvim/clipboard.vim
source ~/.dotfiles/nvim/terminal.vim

source ~/.dotfiles/nvim/blamer.vim
source ~/.dotfiles/nvim/lightline.vim
source ~/.dotfiles/nvim/nerdtree.vim
source ~/.dotfiles/nvim/telescope.vim
source ~/.dotfiles/nvim/startify.vim
source ~/.dotfiles/nvim/twilight.vim
source ~/.dotfiles/nvim/emmet.vim
source ~/.dotfiles/nvim/neoclip.vim
source ~/.dotfiles/nvim/lsp.vim

source ~/.dotfiles/nvim/utils.vim
source ~/.dotfiles/nvim/keys.vim

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
" 
" g:AutoPairsShortcutToggle
" Default: '<M-p>'
" The shortcut to toggle autopairs.
"
" g:AutoPairsShortcutJump
" Default: '<M-n>'
" Jump to the next closed pair
"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
