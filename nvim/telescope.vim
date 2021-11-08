
" Find files using Telescope command-line sugar.
nnoremap <leader>t <cmd>Telescope<cr>
" nnoremap <leader>c <cmd>Telescope treesitter<cr>
nnoremap <leader>c <cmd>Telescope neoclip<cr>
inoremap <A-p> <cmd>Telescope neoclip<cr>
nnoremap <leader>e <cmd>Telescope symbols<cr>
nnoremap <leader>b <cmd>Telescope file_browser<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>: <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" TODO pasar esta wea a lua para hacerla bonita wtf
nnoremap <leader>lr <cmd> :lua require'telescope.builtin'.lsp_references({ layout_strategy='vertical', layout_config={ preview_cutoff=1, preview_height=25 } })<cr>
nnoremap <leader>li <cmd> :lua require'telescope.builtin'.lsp_implementations({ layout_strategy='vertical', layout_config={ preview_cutoff=1, preview_height=25 } })<cr>
nnoremap <leader>ld <cmd> :lua require'telescope.builtin'.lsp_definitions({ layout_strategy='vertical', layout_config={ preview_cutoff=1, preview_height=25 } })<cr>
nnoremap <leader>ldd <cmd> :lua require'telescope.builtin'.lsp_document_diagnostics({ layout_strategy='vertical', layout_config={ preview_cutoff=1, preview_height=25 } })<cr>
nnoremap <leader>lca <cmd> :lua require'telescope.builtin'.lsp_code_actions({ layout_strategy='vertical', layout_config={ preview_cutoff=1, preview_height=25 } })<cr>

lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--hidden',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "  ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {
      ".git",
      "node_modules"
    },
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      --previewer = false,
      mappings = {
        i = {
          ["<c-D>"] = require("telescope.actions").delete_buffer,
        },
        n = {
          ["<c-D>"] = require("telescope.actions").delete_buffer,
        }
      }
    }
  }
}
EOF
