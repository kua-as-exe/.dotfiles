" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ 

" vim-comentary
" ~ https://github.com/tpope/vim-commentary

" [ gcc ] to comment out a line
" [ gc ] to comment out the target of a motion (for example, [ gcap ] to comment out a paragraph)
" [ gc ] in visual mode to comment out the selection

" Toggle comment
"  ~ https://stackoverflow.com/a/40167715
noremap <leader>' :Commentary<cr>


" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ 

" vim-multiple-cursors
" ~ https://github.com/terryma/vim-multiple-cursors
 
"  normal mode / visual mode
"  start: <C-n> start multicursor and add a virtual cursor + selection on the match
"  next: <C-n> add a new virtual cursor + selection on the next match
"  skip: <C-x> skip the next match
"  prev: <C-p> remove current virtual cursor + selection and go back on previous match
"  select all: <A-n> start multicursor and directly select all matches
"  You can now change the virtual cursors + selection with visual mode
"  commands. For instance: c, s, I, A work without any issues. You could also
"  go to normal mode by pressing v and use normal commands there.4


" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ 

" auto-pairs
" ~ https://github.com/jiangmiao/auto-pairs

" auto pair for html syntax
au FileType html,tsx,jsx let b:AutoPairs = AutoPairsDefine({'<' : '>', '<!--': '-->'})


" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ 

" Custom fold
function! CustomFold()
  return printf(' ⧐  %3d %s', v:foldend - v:foldstart + 1, getline(v:foldstart))
endfunction

set fillchars=fold:\ | set foldtext=CustomFold() 

" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~

" This is from: https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear


" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~
" From: https://vimawesome.com/plugin/repeat-vim
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~

: command! RefreshSource source ~/.dotfiles/init.vim


" ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~ ~*~
" GitGlutter signs
"
set signcolumn=yes
highlight GitGutterDelete ctermfg=1
highlight GitGutterAdd    ctermfg=2
highlight GitGutterChange ctermfg=3
highlight clear SignColumn
