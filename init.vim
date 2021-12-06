" 
" Personal Nvim Configuration
" ~ Jorge Arreola
"

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


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
Plug 'jbgutierrez/vim-better-comments' 
Plug 'AckslD/nvim-neoclip.lua'
Plug 'tami5/sqlite.lua'
Plug 'metakirby5/codi.vim'
Plug 'vimsence/vimsence'
Plug 'chrisbra/Colorizer'
Plug 'z3t0/arduvim'
Plug 'voldikss/vim-floaterm'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'dstein64/vim-menu'
Plug 'easymotion/vim-easymotion'

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

" Writing
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 

call plug#end()

source ~/.dotfiles/nvim/theme.vim
source ~/.dotfiles/nvim/sets.vim
source ~/.dotfiles/nvim/clipboard.vim

source ~/.dotfiles/nvim/blamer.vim
source ~/.dotfiles/nvim/lightline.vim
source ~/.dotfiles/nvim/nerdtree.vim
source ~/.dotfiles/nvim/startify.vim
source ~/.dotfiles/nvim/twilight.vim
source ~/.dotfiles/nvim/emmet.vim
source ~/.dotfiles/nvim/lsp.vim
source ~/.dotfiles/nvim/telescope.vim
source ~/.dotfiles/nvim/neoclip.vim
source ~/.dotfiles/nvim/floaterm.vim
source ~/.dotfiles/nvim/easyMotion.vim

source ~/.dotfiles/nvim/terminal.vim
source ~/.dotfiles/nvim/utils.vim
source ~/.dotfiles/nvim/keys.vim
source ~/.dotfiles/nvim/toggle.vim
