
" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~
" GitGlutter signs
"
" Jump over hunks 
nmap <A-}> <Plug>(GitGutterNextHunk)
nmap <A-{> <Plug>(GitGutterPrevHunk)

" Preview Hunk
nmap ghp <Plug>(GitGutterPreviewHunk)

nnoremap <leader>gC <cmd>Git commit .<cr>
nnoremap <leader>gP <cmd>Git push<cr>

:source ~/.dotfiles/nvim/git.lua

" Use fontawesome icons as signs
let g:gitgutter_sign_added = '▍'
let g:gitgutter_sign_modified = '▍'
let g:gitgutter_sign_removed = '▍'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=NONE
highlight SignColumn ctermbg=NONE

" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~
" GitGlutter signs
"
set signcolumn=yes
highlight GitGutterDelete ctermfg=1
highlight GitGutterAdd    ctermfg=2
highlight GitGutterChange ctermfg=3
highlight clear SignColumn

" let g:gitgutter_override_sign_column_highlight = 1
" highlight SignColumn guibg=bg
" highlight SignColumn ctermbg=bg

nmap <Leader>gm <Plug>(git-messenger)

function! s:setup_git_messenger_popup() abort
    " Your favorite configuration here

    " For example, set go back/forward history to <C-o>/<C-i>
    nmap <buffer><C-o> o
    nmap <buffer><C-i> O
endfunction
autocmd FileType gitmessengerpopup call <SID>setup_git_messenger_popup()

let g:git_messenger_always_into_popup = v:true

" Mapping	Description
" q	Close the popup window
" o	older. Back to older commit at the line
" O	Opposite to o. Forward to newer commit at the line
" d	Toggle unified diff hunks only in current file of the commit
" D	Toggle all unified diff hunks of the commit
" r	Toggle word diff hunks only in current file of the commit
" R	Toggle all word diff hunks of current commit
" ?	Show mappings help
