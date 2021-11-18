
let mapleader = " "

" Indent all file
"  ~ https://vim.fandom.com/wiki/Fix_indentation
nnoremap <F7> gg=G<C-o><C-o>

" Clear search
"  ~ https://stackoverflow.com/a/657484
:command! C let @/=""

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
" Split panels
nnoremap <silent> <A-S> :sp<cr>
nnoremap <silent> <A-V> :vsp<cr>

" Start new tab
nnoremap <silent> <A-T> :tabnew<CR>
" Move between tabs Move between tabs and Floater terminals
nnoremap <silent> <expr> <A-h> FloatermOpened() ? ":FloatermPrev<CR>" : ":tabprevious<CR>"
nnoremap <silent> <expr> <A-Left> FloatermOpened() ? ":FloatermPrev<CR>" : ":tabprevious<CR>"
nnoremap <silent> <expr> <A-l> FloatermOpened() ? ":FloatermNext<CR>" : ":tabnext<CR>"
nnoremap <silent> <expr> <A-Right> FloatermOpened() ? ":FloatermNext<CR>" : ":tabnext<CR>"
" Move tabs
nnoremap <silent> <A-H> :tabm -1<CR>
nnoremap <silent> <A-S-Left> :tabm -1<CR>
nnoremap <silent> <A-L> :tabm +1<CR>
nnoremap <silent> <A-S-Right> :tabm +1<CR>

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

" Exit with Alt+Shitft+w
nnoremap <A-W> :bd <CR>

" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~
" GitGlutter signs
"
" Jump over hunks 
nmap <A-M> <Plug>(GitGutterNextHunk)
nmap <A-N> <Plug>(GitGutterPrevHunk)

" Preview Hunk
nmap ghp <Plug>(GitGutterPreviewHunk)

nnoremap <leader>gC <cmd>Git commit .<cr>
nnoremap <leader>gP <cmd>Git push<cr>

" M tenu
:nnoremap <A-m> :Menu<cr>
