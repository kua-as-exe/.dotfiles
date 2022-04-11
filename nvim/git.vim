
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

