#!/bin/bash

# ~ https://github.com/metakirby5/codi.vim
# Codi
# Usage: codi [filetype] [filename]
syntax="${1:-python}"
shift
vim -c \
  "let g:startify_disable_at_vimenter = 1 |\
  set ls=0 noru nonu nornu nocursorline |\
  hi ColorColumn ctermbg=NONE |\
  hi VertSplit ctermbg=NONE |\
  hi NonText ctermfg=0 |\
  Codi $syntax" "$@"
