
call plug#begin('~/.local/share/nvim/plugged')

" TOOLS
" Plug 'neoclide/coc.nvim', {  'branch': 'release',  'do': 'yarn install --frozen-lockfile' } " this is for auto complete, prettier and tslinting
Plug 'neoclide/jsonc.vim'

" ~ https://github.com/neoclide/coc-prettier
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'leafgarland/typescript-vim'
" Plug 'jparise/vim-graphql'
Plug 'rhysd/vim-clang-format'
" REACT SECTION

Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" MISC & UTILS
Plug 'mattn/emmet-vim'
" Plug 'folke/twilight.nvim'
" Plug 'andweeb/presence.nvim'


call plug#end()


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" UTILS
"

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


" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

