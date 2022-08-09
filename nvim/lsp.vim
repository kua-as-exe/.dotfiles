
set completeopt=menu,menuone,noselect

:source ~/.dotfiles/nvim/lsp.lua

let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/.dotfiles/nvim/snippets']

highlight! default link CmpItemKindMatch          Boolean
highlight! default link CmpItemKindMatchFuzzy     Boolean
highlight! default link CmpItemKindText           Label
highlight! default link CmpItemKindMethod         Function
highlight! default link CmpItemKindFunction       Function
highlight! default link CmpItemKindConstructor    Function
highlight! default link CmpItemKindField          Type
highlight! default link CmpItemKindVariable       Type
highlight! default link CmpItemKindClass          Structure
highlight! default link CmpItemKindInterface      Structure
highlight! default link CmpItemKindModule         Structure
highlight! default link CmpItemKindProperty       Type
highlight! default link CmpItemKindUnit           Boolean
highlight! default link CmpItemKindValue          Character
highlight! default link CmpItemKindEnum           Structure
highlight! default link CmpItemKindKeyword        Operator
highlight! default link CmpItemKindSnippet        Special
highlight! default link CmpItemKindColor          Constant
highlight! default link CmpItemKindFile           String
highlight! default link CmpItemKindReference      Character
highlight! default link CmpItemKindFolder         String
highlight! default link CmpItemKindEnumMember     Type
highlight! default link CmpItemKindConstant       Constant
highlight! default link CmpItemKindStruct         Structure
highlight! default link CmpItemKindEvent          Conditional
highlight! default link CmpItemKindOperator       Operator
highlight! default link CmpItemKindTypeParameter  Special

