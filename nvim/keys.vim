
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

" Exit with Alt+Shitft+w
nnoremap <A-W> :q <CR>
