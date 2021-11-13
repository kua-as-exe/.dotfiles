hi FloatermBorder guibg=NONE guifg=white

function! FloatermOpened()
  let found_winnr = floaterm#window#find()
  if found_winnr > 0
    return 1
  endif
  return 0
endfunction

nnoremap <silent> <A-f> :FloatermToggle<CR>
tnoremap <silent> <A-f> <C-\><C-n>:FloatermToggle<CR>
" Movement keys
tnoremap <silent> <expr> <A-l> FloatermOpened() ? "<C-\><C-n> :FloatermNext<CR>" : ""
tnoremap <silent> <expr> <A-h> FloatermOpened() ? "<C-\><C-n> :FloatermPrev<CR>" : ""
tnoremap <silent> <expr> <A-Right> FloatermOpened() ? "<C-\><C-n> :FloatermNext<CR>" : ""
tnoremap <silent> <expr> <A-Left> FloatermOpened() ? "<C-\><C-n> :FloatermPrev<CR>" : ""
" Open new term key
tnoremap <silent> <expr> <A-t> FloatermOpened()? "<C-\><C-n> :FloatermNew<CR>" : ""
" Kill key
tnoremap <silent> <expr> <A-w> FloatermOpened()? "<C-\><C-n> :FloatermKill<CR> <bar> :FloatermShow<CR>" : ""

let g:floaterm_title = ' Terminal ($1/$2) '
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
