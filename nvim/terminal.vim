" TERMINAL UTILS

" start terminal with Alt+T
nnoremap <silent> <expr> <A-t> FloatermOpened()? ":FloatermNew<CR>" : ":terminal<CR>"

  "Exit with ESC
"  ~ https://vi.stackexchange.com/a/6966
" Commmand to set ESC as exit in terminal mode 
: command! TermEscExit :tmap <esc> <c-\><c-n>

" Stop current process and run previous command in Normal Mode
nnoremap t i <c-c><cr> <up><cr> <c-\><c-n>

" Start terminal in insert mode
"  ~ https://github.com/neovim/neovim/issues/8816#issuecomment-410512452
if has('nvim')
    autocmd TermOpen term://* startinsert
endif
