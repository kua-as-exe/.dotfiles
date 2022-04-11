" ~ https://github.com/easymotion/vim-easymotion

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  ; <Plug>(easymotion-bd-w)
map  ñ <Plug>(easymotion-bd-w)
map  <leader><leader>W <Plug>(easymotion-bd-w)
nmap <leader><Leader>w <Plug>(easymotion-overwin-w)

" Gif config
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Gif config
map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" With this option set, v will match both v and V, but V will match V only. Default: 0.
let g:EasyMotion_smartcase = 1
