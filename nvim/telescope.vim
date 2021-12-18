
" Find files using Telescope command-line sugar.
nnoremap <leader>t <cmd>Telescope<cr>
" nnoremap <leader>c <cmd>Telescope treesitter<cr>
nnoremap <leader>c <cmd>Telescope neoclip<cr>
inoremap <A-p> <cmd>Telescope neoclip<cr>
nnoremap <leader>e <cmd>Telescope symbols<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
lua << EOF

-- ~ https://newbedev.com/lua-object-to-string-code-example
function dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k,v in pairs(o) do
      s = s ..k..' = ' .. dump(v) .. ',  '
    end
    return s .. '} '
  elseif type(o) == 'string' then
    return "'"..o.."'"
  else
    return tostring(o)
  end
end

local function set_keymap(...) vim.api.nvim_set_keymap(...) end
local L = '<leader>'
local cmd = ":lua require'telescope.builtin'"
local opts = { 
  noremap = true, 
  silent = true 
}

function keymap(keymap, command, cmdOpts)
  set_keymap('n', L..keymap, cmd..'.'..command..'('..dump(cmdOpts)..')<CR>', opts)
end

local telescope_opts = { 
  layout_config={ 
    preview_cutoff=0.4, 
    preview_height=0.6
  } ,
  layout_strategy='vertical',
}
keymap('lr', 'lsp_references', telescope_opts)
keymap('li', 'lsp_implementations', telescope_opts)
keymap('ld', 'lsp_definitions', telescope_opts)
keymap('ldd', 'lsp_document_diagnostics', telescope_opts)
keymap('lca', 'lsp_code_actions', telescope_opts)

local browser_opts = {
  hidden = true
}
keymap('ff', 'find_files', browser_opts)
keymap('b', 'file_browser', browser_opts)
keymap('fg', 'git_files', browser_opts)
keymap('fb', 'buffers', browser_opts)
keymap(':', 'live_grep', browser_opts)

local git_opts = {}
keymap('gs', 'git_status', git_opts)
keymap('gc', 'git_commits', git_opts)
keymap('gb', 'git_branches', git_opts)

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
    prompt_prefix = " => ",
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
