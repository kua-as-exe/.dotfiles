-- local folderOfThisFile = (...):match("(.-)[^%.]+$") -- returns 'lib.foo.'
-- local folderOfThisFile = dofile('nvim/sidebar/todos.lua') -- returns 'lib.foo.'
-- print(folderOfThisFile)

local sidebar = require("sidebar-nvim")
local config = {
  disable_default_keybindings = 0,
  bindings = nil,
  open = false,
  side = "left",
  initial_width = 25,
  hide_statusline = true,
  update_interval = 1000,
  sections = { "datetime", "git", "diagnostics", "todos"
    -- folderOfThisFile
  }, -- "buffers" "files"
  section_separator = {"", "-----", ""},
  datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
  todos = { ignored_paths = { "~" } },
  disable_closing_prompt = false,
  -- buffers = {
  --   icon = "",
  --   ignored_buffers = {} -- ignore buffers by regex
  -- },
  files = {
    icon = "",
    show_hidden = false,
    ignored_paths = {"%.git$"}
  }
}
sidebar.setup(config)


local function set_keymap(...) vim.api.nvim_set_keymap(...) end
local opts = { noremap = true, silent = true }
set_keymap( 'n', '<leader>st', ':lua require("sidebar-nvim").toggle() <CR>', opts )
set_keymap( 'n', '<c-s>', ':lua require("sidebar-nvim").toggle() <CR>', opts )

--TODO: add some things
--HACK: asd

