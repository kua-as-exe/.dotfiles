-- ~ https://newbedev.com/lua-object-to-string-code-example
function _G.Dump(o)
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

-- https://gist.github.com/haggen/2fd643ea9a261fea2094
math.randomseed(os.time())
local character_set = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

local string_sub = string.sub
local math_random = math.random
local table_concat = table.concat
local character_set_amount = #character_set
local number_one = 1
local default_length = 10

local function generate_key(length)
    local random_string = {}

    for _ = number_one, length or default_length do
        local random_number = math_random(number_one, character_set_amount)
        local character = string_sub(character_set, random_number, random_number)

        random_string[#random_string + number_one] = character
    end

    return table_concat(random_string)
end
--

local function set_keymap(...) vim.api.nvim_set_keymap(...) end
local L = '<leader>'
local opts = { noremap = true, silent = true }

local obj = {}

-- {
--   [key]: {
--     value: x,
--     opts: {
--       x1: { ... }
--       x2: { ... }
--     }
--   }
-- }

function _G.choiceSet(key, value)
  obj[key].value = value
end

function _G.choiceGetValue(key)
  return obj[key].value
end

function _G.choiceGet(key)
  if ( #obj[key].opts == 0 ) then
    return {}
  end
  local res = obj[key].opts[ obj[key].value ]
  -- print(Dump(res))
  return res
end

function _G.choiceNext(key)
  local val = choiceGetValue(key)
  if( val >= #obj[key].opts ) then
    val = 1
  else
    val = val + 1
  end
  -- print( val )
  choiceSet(key, val)
end

local function setupList(key, list)
  local temp = {
    value = 0,
    opts = {}
  }

  local len = #list
  if( len > 0 ) then
    temp.value = 1
    for i=1, len do
      temp.opts[i] = list[i]
    end
  end
  obj[key] = temp
end

local function setupCmdWithProps(params)
  local key = generate_key(5)
  local keymap = params.keymap
  local func = params.func
  local props = params.props

  local mainCmd = func.."(choiceGet('"..key.."'))<CR>"
  local modifierCmd = "choiceNext('"..key.."');"..mainCmd
  local modifierKey = ';'

  setupList(key, props)

  set_keymap('n',L..keymap,':lua '..mainCmd, opts)
  set_keymap('n',L..modifierKey..keymap,':lua '..modifierCmd, opts)
end

local function vertical(percent)
  local temp = {
      layout_strategy="vertical",
  }
  if( percent ~= nil ) then
    temp.layout_config={
      preview_height=percent/100,
      preview_cutoff=1-percent/100,
    }
  end

  return temp
end

local function horizontal()
  local temp = {
      layout_strategy="horizontal",
  }
  return temp
end

function Keymap(keymap, command, props)
  setupCmdWithProps({
    keymap = keymap,
    func = command,
    props = props
  })
end

local builtin = "require'telescope.builtin'."

local telescope_opts = {
  vertical(60),
  vertical(30),
  horizontal()
}

Keymap('lr', builtin..'lsp_references', telescope_opts)
Keymap('li', builtin..'lsp_implementations', telescope_opts)
Keymap('ld', builtin..'lsp_definitions', telescope_opts)
Keymap('lwd', builtin..'lsp_workspace_diagnostics', telescope_opts)
Keymap('ldd', builtin..'lsp_document_diagnostics', telescope_opts)
Keymap('lds', builtin..'lsp_document_symbols', telescope_opts)
Keymap('lca', builtin..'lsp_code_actions', telescope_opts)
Keymap('.', builtin..'lsp_code_actions', telescope_opts)

local browser_opts = { { hidden = true } }
Keymap('ff', builtin..'find_files', browser_opts)

Keymap('fg', builtin..'git_files', browser_opts)
Keymap('fb', builtin..'buffers', browser_opts)
Keymap(':', builtin..'live_grep', browser_opts)

local git_opts = { horizontal(), vertical(60) }
Keymap('gs', builtin..'git_status', git_opts)
Keymap('gc', builtin..'git_commits', git_opts)
Keymap('gb', builtin..'git_branches', git_opts)
Keymap('gbc', builtin..'git_bcommits', { vertical(60), horizontal() })

local general = {  }
Keymap('fe', builtin..'symbols', general)
Keymap('fc', builtin..'commands', general)
Keymap('T', builtin..'treesitter', general)
Keymap('fh', builtin..'help_tags', general)
Keymap('fm', builtin..'marks', general)

Keymap('c', "require('telescope').extensions.neoclip.default", { vertical(60) } )
Keymap('b', "require('telescope').extensions.file_browser.file_browser", { vertical(30), vertical(60), horizontal() } )

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
      '--smart-case',
      '-g', '!/package-lock.json'
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
      -- "lib",
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
  },
  extensions = {
    file_browser = {
      -- theme = "ivy",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:

-- require("telescope").load_extension "file_browser"
--
-- Insert / Normal	Action
-- <A-c>/c	Create file/folder at current path (trailing path separator creates folder)
-- <A-r>/r	Rename multi-selected files/folders
-- <A-m>/m	Move multi-selected files/folders to current path
-- <A-y>/y	Copy (multi-)selected files/folders to current path
-- <A-d>/d	Delete (multi-)selected files/folders
-- <C-o>/o	Open file/folder with default system application
-- <C-g>/g	Go to parent directory
-- <C-e>/e	Go to home directory
-- <C-w>/w	Go to current working directory (cwd)
-- <C-t>/t	Change nvim's cwd to selected folder/file(parent)
-- <C-f>/f	Toggle between file and folder browser
-- <C-h>/h	Toggle hidden files/folders
-- <C-s>/s	Toggle all entries ignoring ./ and ../

