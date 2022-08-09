local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ ",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

local types = require("cmp.types")
local str = require("cmp.utils.str")
local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local function check_backspace()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

  local lspkind = require('lspkind')
  lspkind.init({
    mode = "symbol_text",
    -- with_text = true,
    preset = 'codicons',
    symbol_map = kind_icons,
  })

  local cmp = require'cmp'
  function getTableKeys(tab)
   local keys = ""
   for k,_ in pairs(tab) do
     keys = keys..' '..k
   end
   return keys
  end
  -- local t = function(str)
  --   return vim.api.nvim_replace_termcodes(str, true, true, true)
  -- end

  cmp.setup({
    completion = {
      keyword_length = 1,
      completeopt = "menu,noselect"
    },
    view = {
      entries = 'custom',
    },
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = lspkind.cmp_format({
        mode = "text",
        with_text = true,
        maxwidth = 50,
        menu = {
          buffer = " [buffer]",
          nvim_lsp = " [LSP]",
          utilsnip = " [snippet]",
          nvim_lua = "  [lua]",
          latex_symbols = " [latex]",
        },
        
        

        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function (entry, vim_item)
          -- Get the full snippet (and only keep first line)
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])

          return vim_item
        end
      })
      -- format = function(entry, vim_item)
      --   -- vim_item.kind = lspkind.presets.default[vim_item.kind]
      --   lspkind-nvim
      --   vim_item.kind = lspkind.presets.codicons[vim_item.kind]
         
      --   -- vim_item.menu = ({
      --   --   nvim_lsp = "[LSP]",
      --   --   look = "[Dict]",
      --   --   buffer = "[Buffer]",
      --   --   utilsnip = "[utilsnip]",
      --   --   nvim_lua = "[Lua]",
      --   --   latex_symbols = "[Latex]",
      --   -- })[entry.source.name]
      --   vim_item.menu = nil

      --   -- print(getTableKeys( vim_item )) -- dup kind menu word abbr

      --   return vim_item
      -- end
    },
    mapping = {
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<TAB>'] = cmp.mapping(function(fallback)
        if cmp.visible() == 1 then
          vim.fn.feedkeys(t("<C-n>"), "n")
        elseif check_backspace() then
          return vim.fn.feedkeys(t("<Tab>"), 'n')
        elseif vim.api.nvim_eval([[ UltiSnips#CanExpandSnippet() ]]) == 1 then
          return vim.fn['UltiSnips#ExpandSnippetOrJump']()
        else
          fallback()
        end
      end, { "i", "s" }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          vim.fn.feedkeys(t("<C-f>"), 'n')
        end
      end, { 'i', 's' })
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips', max_item_count = 3  }, -- For ultisnips users.
      { name = 'buffer', keyword_length = 5, max_item_count = 5  },
    }),
    experimental = {
      ghost_text = false,
    },
  })

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


  local nvim_lsp = require('lspconfig')
  local on_attach = function(client, bufnr)

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

     -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('n', '<A-<>', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end
  
  local servers = {'tsserver', 'pyright', 'clangd', 'vimls', 'bashls'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
  
  nvim_lsp.arduino_language_server.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd =  {
      -- Required
      "arduino-language-server",
      "-cli-config", "~/.arduino15/arduino-cli.yaml",
      -- Optional
      -- "-cli", "/path/to/ardUIno-cli",
      -- "-clangd", "/path/to/clangd"
    },
  })

  nvim_lsp.jsonls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      commands = {
        Format = {
          function()
            vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
          end
        }
      }
  }

  nvim_lsp.zeta_note.setup({
    cmd={'~/.dotfiles/bin/zeta-note'}
  })

  nvim_lsp.sumneko_lua.setup {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          -- path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },

    -- nvim_lsp.tailwindcss.setup { }

  }



 -- LSP SAGA

local lspsaga = require 'lspsaga'

lspsaga.setup { -- defaults ...
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  diagnostic_header_icon = "   ",
  -- code action title icon
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  definition_preview_icon = "  ",
  border_style = "single",
  rename_prompt_prefix = "➤",
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
}
