" 
" Personal Nvim Configuration
" ~ Jorge Arreola
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
" Plugins
"
"
call plug#begin('~/.local/share/nvim/plugged')

" THEMES
" Plug 'yashguptaz/calvera-dark.nvim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'itchyny/lightline.vim'

" EPLORER
Plug 'preservim/nerdtree'
let g:NERDTreeIgnore = ['^node_modules$', '^.git$'] " ~ https://stackoverflow.com/questions/61467343/how-to-ignore-certain-folders-when-recursively-opening-files-in-nerdtree

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" TOOLS
" Plug 'neoclide/coc.nvim', {  'branch': 'release',  'do': 'yarn install --frozen-lockfile' } " this is for auto complete, prettier and tslinting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
        \ 'coc-tsserver', 
        \ 'coc-css',
        \ 'coc-html', 
        \ 'coc-json', 
        \ 'coc-prettier', 
        \ 'coc-eslint',
        \ 'coc-discord-rpc', 
      \]  " list of CoC extensions needed
" \ 'coc-tslint-plugin', 
Plug 'neoclide/jsonc.vim'

" ~ https://github.com/neoclide/coc-prettier
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'leafgarland/typescript-vim'
" Plug 'jparise/vim-graphql'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-clang-format'

" REACT SECTION
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" MISC & UTILS
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
Plug 'tpope/vim-commentary'
" ~ https://github.com/tpope/vim-commentary
" [ gcc ] to comment out a line
" [ gc ] to comment out the target of a motion (for example, [ gcap ] to comment out a paragraph)
" [ gc ] in visual mode to comment out the selection
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
" Plug 'folke/twilight.nvim'
" Plug 'andweeb/presence.nvim'

Plug 'wakatime/vim-wakatime'
Plug 'dhruvasagar/vim-open-url'
Plug 'terryma/vim-multiple-cursors'
"  normal mode / visual mode
"  start: <C-n> start multicursor and add a virtual cursor + selection on the match
"  next: <C-n> add a new virtual cursor + selection on the next match
"  skip: <C-x> skip the next match
"  prev: <C-p> remove current virtual cursor + selection and go back on previous match
"  select all: <A-n> start multicursor and directly select all matches
"  You can now change the virtual cursors + selection with visual mode
"  commands. For instance: c, s, I, A work without any issues. You could also
"  go to normal mode by pressing v and use normal commands there.4

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-telescope/telescope-symbols.nvim'

call plug#end()


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" 
" General Configurations
"
"
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

" TELESCOPE
" Find files using Telescope command-line sugar.
nnoremap <leader>t <cmd>Telescope<cr>
nnoremap <leader>c <cmd>Telescope treesiter<cr>
nnoremap <leader>e <cmd>Telescope symbols<cr>
nnoremap <leader>b <cmd>Telescope file_browser<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>: <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--hidden',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "  ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {
      ".git",
      "node_modules"
    },
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
EOF


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" THEMES
"
"
let g:material_theme_style = 'default-comunity'

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active':{
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [  ['lineinfo'], ['percent'], ['filetype', 'keymap'] ]
      \ },
      \ 'separator': { 'left': "\ue0b8", 'right': "\ue0ba"  },
      \ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0bb"  },
      \ 'mode_map': {
      \ 'n' : 'N', 'i' : 'I', 'R' : 'R',
      \ 'v' : 'V', 'V' : 'VL',
      \ "\<C-v>": 'VB',
      \ 'c' : 'C', 's' : 'S', 'S' : 'SL',
      \ "\<C-s>": 'SB',
      \ 't': 'T',
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly',
      \   'lineinfo': 'LightlineLineinfo',
      \   'percent': 'LightlinePercent',
      \   'filetype': 'LightlineFiletype'
      \ },
      \ }

function! LightlineFilename()
  let path = expand('%:p')
  let splitted = split(path, "/")
  let filename = expand('%:t:r')

  " Hide filename in nerdtree
  if &filetype == 'nerdtree'
    return splitted[len(splitted)-2] " root dir name
  endif
  " Hide filename in terminal
  if &buftype == 'terminal'
    return ""
  endif
  " file path relative to project git root directory
  " ~ https://github.com/itchyny/lightline.vim/issues/293#issuecomment-373710096
  " let root = fnamemodify(get(b:, 'git_dir'), ':h')
  " if path[:len(root)-1] ==# root
  "  return path[len(root)+1:]
  " endif
  
  " Show the up folder + filename
  " eg: pages/index.tsx
  let lastTwo = join( splitted[-2:], "/" )
  return lastTwo

endfunction

function! Hidden()
  return &filetype =~# '\v(help|vimfiler|unite|nerdtree)'
endfunction

function! LightlineReadonly()
  return &readonly && !Hidden() ? 'RO' : ''
endfunction

function! LightlineModified()
  return !Hidden() && &modified ? '+': ''
endfunction

function! LightlineLineinfo()
  return !Hidden() ? printf("%3d:%-2d", line('.'), col('.')) : ''
endfunction

function! LightlinePercent()
  return !Hidden() ? printf("%3d%%", 100 * line('.') / line('$')) : ''
endfunction

function! LightlineFiletype()
  return !Hidden() && &ft!=#"" ? &ft: ''
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0


colorscheme material

hi Comment guifg=#50abbf
hi Normal guibg=NONE ctermbg=NONE

"
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

let g:startify_custom_header = startify#center([
\ '',
\ '🥐 Bienvenido, Jorge',
\ '',
\ ])

" twilight
" lua << EOF
"   require("twilight").setup {
"     -- your configuration comes here
"     -- or leave it empty to use the default settings
"     -- refer to the configuration section below
"   }
" EOF

" Custom fold
function! CustomFold()
  return printf(' ⧐  %3d %s', v:foldend - v:foldstart + 1, getline(v:foldstart))
endfunction

set fillchars=fold:\ | set foldtext=CustomFold() 

let g:python3_host_prog='/bin/python3'
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" UTILS
"

" EXPLORER
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

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

" auto-pairs
" ~ https://github.com/jiangmiao/auto-pairs
au FileType html,tsx,jsx let b:AutoPairs = AutoPairsDefine({'<' : '>', '<!--': '-->'})

" Indent all file
"  ~ https://vim.fandom.com/wiki/Fix_indentation
nnoremap <F7> gg=G<C-o><C-o>

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
" inoremap <expr>j pumvisible() ? "\<C-n>" : "\j"
" inoremap <expr>k pumvisible() ? "\<C-p>" : "\k"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>


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

" Make <CR> and <TAB> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gr <Plug>(coc-references)

nnoremap <leader>m :call CocAction('diagnosticNext')<cr> 
nnoremap <leader>n :call CocAction('diagnosticPrevious')<cr>

nnoremap <leader>cc <Plug>(coc-command)
nnoremap <leader>do <Plug>(coc-codeaction)
nnoremap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xnoremap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader>p :CocCommand prettier.formatFile<cr>

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

" Move between tabs Move between tabs
nnoremap <A-Left> :tabprevious<CR>                                                                            
nnoremap <A-h> :tabprevious<CR>                                                                            
nnoremap <A-Right> :tabnext<CR>
nnoremap <A-l> :tabnext<CR>
" Start new panel
nnoremap <A-T> :tabnew<CR>

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

" TERMINAL UTILS
"
" exit with ESC
"  ~ https://vi.stackexchange.com/a/6966
" start terminal with Alt+T
nnoremap <A-t> :terminal<CR>
" Commmand to set ESC as exit in terminal mode 
: command! TermEscExit :tmap <esc> <c-\><c-n>
" Run previous command in Normal Mode
nnoremap t i <c-c><cr> <up><cr> <c-\><c-n>

"  ~ https://github.com/neovim/neovim/issues/8816#issuecomment-410512452
if has('nvim')
    autocmd TermOpen term://* startinsert
endif

set clipboard=unnamed
" Clipboard linux ~ https://stackoverflow.com/a/15971506
"   gg"+yG – copy the entire buffer into + (normal mode)
"   "*dd – cut the current line into * (normal mode)
"   "+p – paste from + after the cursor (works in both normal and visual modes)
"   :%y * – copy the entire buffer into * (this one is an ex command)

" clipboard suppport to WSL
"  ~ https://superuser.com/a/1557751
" let g:clipboard = {
    " \   'name': 'win32yank-wsl',
    " \   'copy': { '+': 'win32yank.exe -i --crlf', '*': 'win32yank.exe -i --crlf' },
    " \   'paste': {  '+': 'win32yank.exe -o --lf',  '*': 'win32yank.exe -o --lf' },
    " \   'cache_enabled': 0,
    " \ }
" WSL yank support
" let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
" if executable(s:clip)
"     augroup WSLYank
"         autocmd!
"         autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
"     augroup END
" endif

" nmap <c-e> ggVGy<c-o>
inoremap <c-z> <c-o>u
nnoremap <A-W> :q <CR>

" delete whole word with Ctrl + backspace
inoremap <c-BS> <c-o>diw

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

