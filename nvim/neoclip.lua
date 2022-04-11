require('neoclip').setup({
  enable_persistent_history = true,
  content_spec_column = true,
  keys = {
    -- telescope = {
    --   i = {
    --     select = '<cr>',
    --     paste = '<c-j>',
    --     paste_behind = '<c-k>',
    --     custom = {},
    --   },
    --   n = {
    --     select = '<cr>',
    --     paste = 'p',
    --     paste_behind = 'P',
    --     custom = {},
    --   },
    -- },
  },
})

require('telescope').load_extension('neoclip')

