let g:startify_custom_header = startify#center([
\ '',
\ '🥐 Bienvenido, Jorge',
\ '',
\ ])

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ ]

let g:startify_commands = [
      \ {'g': ['Github', ':call open_url#open("https://github.com")']},
      \ {'G': ['My Github', ':call open_url#open("https://github.com/JorgeArreolaS")']},
      \ {'t': ['Terminal exit Insert mode with ESC', 'TermEscExit']},
      \ ]


" It also supports session persistence, so once a session is loaded, it gets saved automatically when Vim is quit: 
let g:startify_session_persistence = 1
let g:startify_files_number        = 8

nnoremap <M-s> :Startify<cr>

