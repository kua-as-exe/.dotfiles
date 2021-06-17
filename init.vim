" 
" Personal Nvim Configuration
" ~ Jorge Arreola
"

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" Useful links:
" ~ https://stackoverflow.com/a/28279006 // 
"   > You can jump to a mark by typing '<mark>, so '. will take you to the place of the last edit, '' will take you back to where you were, and '" takes you to the position you saved the file at.
" 

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 
" Plugins
"
"
call plug#begin('~/.local/share/nvim/plugged')

" THEMES
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'itchyny/lightline.vim'

" EPLORER
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" TOOLS
Plug 'neoclide/coc.nvim', {  'branch': 'release',  'do': 'yarn install --frozen-lockfile' } " this is for auto complete, prettier and tslinting
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-eslint']  " list of CoC extensions needed
Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-fugitive'

" REACT SECTION
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" MISC
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
Plug 'vimsence/vimsence'
Plug 'tpope/vim-commentary'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'

call plug#end()


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 
" General Configurations
"
"
syntax on

set mouse=a
set noerrorbells
set expandtab
set smartindent
set autoindent
set number
set relativenumber
set numberwidth=1
set nowrap

set tabstop=4
set shiftwidth=4
set expandtab

set ignorecase
set encoding=utf-8
set showmatch
set cursorline
set termguicolors

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" THEMES
"
"
let g:material_theme_style = 'default-comunity'

let g:lightline = {
       \ 'colorscheme': 'srcery_drk',
       \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2"  },
       \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3"  }
       \ }

colorscheme material
hi Comment guifg=#50abbf
hi Normal guibg=NONE ctermbg=NONE

" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
"  ~ https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" UTILS
"

" EXPLORER
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree



" EMMET
" let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
    \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
    \  'typescript' : {
    \      'extends' : 'jsx',
    \  },
    \}


" Clear search
"  ~ https://stackoverflow.com/a/657484
:command! C let @/=""

" This is from: https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>l :call CocAction('diagnosticNext')<cr> 
nmap <leader>h :call CocAction('diagnosticPrevious')<cr>

nmap <leader>cc <Plug>(coc-command)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>cp <Plug>(coc-prettier)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" Toggle comment
"  ~ https://stackoverflow.com/a/40167715
noremap <leader>' :Commentary<cr>

" Move between panels
"  ~ https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Arrow keys adaptation
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-UP> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

" Move lines
"  ~ https://vim.fandom.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Clone lines
nnoremap <A-J> yyp
nnoremap <A-K> yyP
vnoremap <A-J> yp
vnoremap <A-K> yP

" Ctrl-Z to save and close file
nnoremap <c-z> :x<CR>
inoremap <c-z> <c-o>:x<CR>
" nnoremap <c-Z> :q!<CR>
" inoremap <c-Z> <c-o>:q!<CR>

" TERMINAL UTILS

" exit with ESC
"  ~ https://vi.stackexchange.com/a/6966
tnoremap <Esc> <C-\><C-n> 
" go back to last thing with Ctrl+Z
tnoremap <c-z> <C-\><C-n> <C-o>
" start terminal with Alt+T
nnoremap <A-t> :terminal<CR>

"  ~ https://github.com/neovim/neovim/issues/8816#issuecomment-410512452
if has('nvim')
    autocmd TermOpen term://* startinsert
endif

" clipboard suppport to WSL
"  ~ https://superuser.com/a/1557751

set clipboard+=unnamedplus
let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif



