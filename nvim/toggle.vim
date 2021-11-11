
" :help toggle
nnoremap <silent><leader>hn <cmd>:set number!<cr>
nnoremap <silent><leader>hr <cmd>:set relativenumber!<cr>
nnoremap <silent><leader>hl <cmd>:set cursorline!<cr>
nnoremap <leader>hb <cmd>BlamerToggle<cr>
nnoremap <leader>hi <cmd>IndentLinesToggle<cr>

nnoremap <leader>ha :set nonu nornu nocursorline <bar> IndentLinesDisable <bar> BlamerHide <cr>
nnoremap <leader>hA :set nu rnu cursorline <bar> IndentLinesEnable <bar> BlamerShow <cr>

