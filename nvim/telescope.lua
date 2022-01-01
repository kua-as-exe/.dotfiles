-- ~ https://newbedev.com/lua-object-to-string-code-example
function Dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k,v in pairs(o) do
      s = s ..k..' = ' .. Dump(v) .. ',  '
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
local opts = { noremap = true, silent = true }

function Keymap(keymap, command, cmdOpts)
  set_keymap('n', L..keymap, cmd..'.'..command..'('..Dump(cmdOpts)..')<CR>', opts)
end

local telescope_opts = {
  layout_config={
    preview_cutoff=0.4,
    preview_height=0.6
  } ,
  layout_strategy='vertical',
}

Keymap('lr', 'lsp_references', telescope_opts)
Keymap('li', 'lsp_implementations', telescope_opts)
Keymap('ld', 'lsp_definitions', telescope_opts)
Keymap('lwd', 'lsp_workspace_diagnostics', telescope_opts)
Keymap('ldd', 'lsp_document_diagnostics', telescope_opts)
Keymap('lca', 'lsp_code_actions', telescope_opts)

local browser_opts = { hidden = true }
Keymap('ff', 'find_files', browser_opts)
Keymap('b', 'file_browser', browser_opts)
Keymap('fg', 'git_files', browser_opts)
Keymap('fb', 'buffers', browser_opts)
Keymap(':', 'live_grep', browser_opts)

local git_opts = {}
Keymap('gs', 'git_status', git_opts)
Keymap('gc', 'git_commits', git_opts)
Keymap('gb', 'git_branches', git_opts)
Keymap('gbc', 'git_bcommits', {
  layout_config={
    preview_cutoff=0.4,
    preview_height=0.6
  } ,
  layout_strategy='vertical',
})

local general = {}
Keymap('fe', 'symbols', general)
Keymap('fc', 'commands', general)
Keymap('T', 'treesitter', general)
Keymap('fh', 'help_tags', general)
Keymap('fm', 'marks', general)

local neoclip = {
  layout_config={
    preview_cutoff=0.6,
    preview_height=0.4
  } ,
  layout_strategy='vertical',
}

set_keymap('n',L..'c',":lua require('telescope').extensions.neoclip.default("..Dump( neoclip )..")<CR>", opts)
set_keymap('n','<A-c>',":lua require('telescope').extensions.neoclip.default("..Dump( neoclip )..")<CR>", opts)

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
    selection_caret = " |> ",
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
      "node_modules",
      "dist",
      "build",
      "lib",
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
