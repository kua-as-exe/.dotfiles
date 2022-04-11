" Main configuration for lspsaga in nvim/lsp.lua

nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

" -- show hover doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>

" -- scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" -- scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" -- lsp provider to find the cursor word definition and reference
nnoremap <silent><leader>sf <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

" -- show signature help
nnoremap <silent><leader>sh <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>

" -- preview definition
nnoremap <silent><leader>sd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

" -- rename
nnoremap <silent><leader>rn <cmd>lua require('lspsaga.rename').rename()<CR>

" Diagnostics
" -- show
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
" -- only show diagnostic if cursor is over the area
nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

" -- jump diagnostic
nnoremap <silent><A-[> :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent><leader>n :Lspsaga diagnostic_jump_prev<CR>

nnoremap <silent><A-]> :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent><leader>m :Lspsaga diagnostic_jump_next<CR>

