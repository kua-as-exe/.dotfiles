
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


" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

