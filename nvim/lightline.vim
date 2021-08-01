
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active':{
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [  ['lineinfo'], ['percent'], ['filetype', 'keymap'] ]
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
      \   'filetype': 'LightlineFiletype'
      \ },
      \ }

function! LightlineFilename()
  let path = expand('%:p')
  let splitted = split(path, "/")
  let filename = expand('%:t:r')

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
  return lastTwo

endfunction

function! Hidden()
  return &filetype =~# '\v(help|vimfiler|unite|nerdtree)'
endfunction

function! LightlineReadonly()
  return &readonly && !Hidden() ? 'RO' : ''
endfunction

function! LightlineModified()
  return !Hidden() && &modified ? '+': ''
endfunction

function! LightlineLineinfo()
  return !Hidden() ? printf("%3d:%-2d", line('.'), col('.')) : ''
endfunction

function! LightlinePercent()
  return !Hidden() ? printf("%3d%%", 100 * line('.') / line('$')) : ''
endfunction

function! LightlineFiletype()
  return !Hidden() && &ft!=#"" ? &ft: ''
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
