
let g:lightline_hidden = {
  \ 'lineinfo': 0,
  \ 'percent': 0,
  \ 'filetype': 0,
  \ 'gitstatus': 0,
  \ 'gitbranch': 0,
  \ 'filename': 0,
  \ 'gps': 0,
  \ }

function! ToggleLightlineHidden(item)
  let g:lightline_hidden[a:item] = !g:lightline_hidden[a:item]
endfunction

nnoremap <silent><leader>1 :call ToggleLightlineHidden('gitbranch')<CR>
nnoremap <silent><leader>2 :call ToggleLightlineHidden('filename')<CR>
nnoremap <silent><leader>3 :call ToggleLightlineHidden('gps')<CR>

nnoremap <silent><leader>6 :call ToggleLightlineHidden('gitstatus')<CR>
nnoremap <silent><leader>7 :call ToggleLightlineHidden('filetype')<CR>
nnoremap <silent><leader>8 :call ToggleLightlineHidden('percent')<CR>
nnoremap <silent><leader>9 :call ToggleLightlineHidden('lineinfo')<CR>

nnoremap <silent><leader>0 
      \:call ToggleLightlineHidden('lineinfo')<CR>
      \:call ToggleLightlineHidden('percent')<CR>
      \:call ToggleLightlineHidden('filetype')<CR>
      \:call ToggleLightlineHidden('gitstatus')<CR>

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active':{
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified'], ['gps'] ],
      \   'right': [  ['lineinfo'], ['percent'], [ 'gitstatus' , 'filetype', 'keymap'] ]
      \ },
      \ 'separator': { 'left': "\ue0b8", 'right': "\ue0ba"  },
      \ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0bb"  },
      \ 'mode_map': {
      \ 'n' : 'N', 'i' : 'I', 'R' : 'R',
      \ 'v' : 'V', 'V' : 'VL',
      \ "\<C-v>": 'VB',
      \ 'c' : 'C', 's' : 'S', 'S' : 'SL',
      \ "\<C-s>": 'SB',
      \ 't': 'T',
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly',
      \   'lineinfo': 'LightlineLineinfo',
      \   'percent': 'LightlinePercent',
      \   'filetype': 'LightlineFiletype',
      \   'gitbranch': 'GitBranch',
      \   'gitstatus': 'GitStatus',
      \   'gps': 'VimGps'
      \ },
      \ 'tab_component_function': {
      \   'tabnum': 'LightlineWebDevIcons',
		  \   'filename': 'TabFilename',
      \   'modified': 'TabModified',
      \ },
      \ }

function! BufNumberFromTabNumber(n)
  return tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
endfunction

function! TabFilename(n)
  let name = lightline#tab#filename(a:n)

  if name == '[No Name]'
    let name = ''
  endif
  if name == 'zsh' || name == 'bash'
    let name = '</>'
  endif
  if name =~ 'index'
    let l:bufnr = BufNumberFromTabNumber(a:n)
    let path = expand('#'.l:bufnr.':p')
    let splitted = split(path, "/")
    let name = splitted[-2]
  endif
  return name
endfunction

function! TabModified(n)
  let l:modified = lightline#tab#modified(a:n)
  let l:name = lightline#tab#filename(a:n)
  if name == 'zsh'
    let l:modified = ''
  endif
  return l:modified
endfunction

" ~ https://github.com/itchyny/lightline.vim/issues/469#issuecomment-630819474
function! LightlineWebDevIcons(n)
  let l:bufnr = BufNumberFromTabNumber(a:n)
  let l:icon = WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))

  let l:name = lightline#tab#filename(a:n)
  if name == 'zsh'
    let l:icon = ''
  endif
  return l:icon
endfunction

function! GitBranch()
  if IsHidden('gitbranch')
    return ''
  endif
  return fugitive#head()
endfunction

function! GetSplittedPath()
  let path = expand('%:p')
  let splitted = split(path, "/")
  " let filename = expand('%:t:r')
  return splitted
endfunction

function! LightlineFilename()
  if IsHidden('filename') 
    return '' 
  endif
  let splitted = GetSplittedPath()

  " Hide filename in nerdtree
  if &filetype == 'nerdtree'
    return splitted[len(splitted)-2] " root dir name
  endif
  " Hide filename in terminal
  if &buftype == 'terminal'
    return ""
  endif
  " file path relative to project git root directory
  " ~ https://github.com/itchyny/lightline.vim/issues/293#issuecomment-373710096
  " let root = fnamemodify(get(b:, 'git_dir'), ':h')
  " if path[:len(root)-1] ==# root
  "  return path[len(root)+1:]
  " endif
  
  " Show the up folder + filename
  " eg: pages/index.tsx
  let lastTwo = join( splitted[-2:], "/" )
  let name = lastTwo

  let filename = expand('%:t')
  let icon = ""
  if filename =~ ""
    let icon = WebDevIconsGetFileTypeSymbol(filename) 
    if name isnot ""
      let icon = icon . ' '
    endif
  endif

  return join([ icon, name ], '')
endfunction

function! Hidden()
  return &filetype =~# '\v(help|vimfiler|unite|nerdtree)'
endfunction
function! IsHidden(item) 
  return g:lightline_hidden[a:item]
endfunction

function! LightlineReadonly()
  return &readonly && !Hidden() ? 'RO' : ''
endfunction

function! LightlineModified()
  return !Hidden() && &modified ? '+': ''
endfunction

function! LightlineLineinfo()
  return !IsHidden('lineinfo') && !( Hidden() || &buftype == 'terminal' ) ? printf("%3d:%-2d", line('.'), col('.')) : ''
endfunction

function! LightlinePercent()
  return !IsHidden('percent') && !(&filetype =~# '\v(vimfiler|unite|nerdtree)' || &buftype == 'terminal') ? printf("%3d%%", 100 * line('.') / line('$')) : ''
endfunction

function! LightlineFiletype()
  return !Hidden() && !IsHidden('filetype') && &ft!=#"" ? &ft: ''
endfunction

function! GitStatus()
  if Hidden() || IsHidden('gitstatus') || &buftype == 'terminal'
    return ''
  endif
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction


lua << EOF
function _G.StatusLineGPS()
  -- Lua
  local gps = require("nvim-gps")

  if gps.is_available() then  -- Returns boolean value indicating whether a output can be provided
    return gps.get_location()  -- Returns a string with context information
  else
    return ""
  end
end
EOF

" FIX: Fix VimGPS in statusline
function! VimGps()
  if Hidden() || IsHidden('gps')
    return ''
  endif
  return v:lua.StatusLineGPS()
endfunction


let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

let s:p = g:lightline#colorscheme#wombat#palette

"let s:p.{mode}.{where} = [ [ {guifg}, {guibg}, {ctermfg}, {ctermbg} ], ... ]
let s:p.tabline.tabsel = [ [ '#d0d0d0', '#041f4f', 252, 66, 'bold' ] ]

let g:lightline#colorscheme#wombat#palette = s:p
unlet s:p

