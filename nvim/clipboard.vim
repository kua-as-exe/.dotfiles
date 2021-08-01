
set clipboard=unnamed

" Clipboard linux ~ https://stackoverflow.com/a/15971506

"   gg"+yG – copy the entire buffer into + (normal mode)
"   "*dd – cut the current line into * (normal mode)
"   "+p – paste from + after the cursor (works in both normal and visual modes)
"   :%y * – copy the entire buffer into * (this one is an ex command)

" Clipboard suppport to WSL

"  ~ https://superuser.com/a/1557751
" let g:clipboard = {
    " \   'name': 'win32yank-wsl',
    " \   'copy': { '+': 'win32yank.exe -i --crlf', '*': 'win32yank.exe -i --crlf' },
    " \   'paste': {  '+': 'win32yank.exe -o --lf',  '*': 'win32yank.exe -o --lf' },
    " \   'cache_enabled': 0,
    " \ }

" WSL yank support
" let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
" if executable(s:clip)
"     augroup WSLYank
"         autocmd!
"         autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
"     augroup END
" endif
