
set completeopt=menu,menuone,noselect

:source ~/.dotfiles/nvim/lsp.lua

let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/.dotfiles/nvim/snippets']

" To enable syntax code completion you can run:
"     setlocal omnifunc=syntaxcomplete#Complete
" The bottom will set completion to this script only if a specific plugin does
" not already exist for that filetype.

" if has("autocmd") && exists("+omnifunc")
" 	autocmd Filetype *
" 		    \	if &omnifunc == "" |
" 		    \		setlocal omnifunc=syntaxcomplete#Complete |
" 		    \	endif
"     endif

