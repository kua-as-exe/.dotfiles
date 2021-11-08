

lua require'neoclip'.setup()

lua << EOF
  require('neoclip').setup({
    enable_persistant_history = true
  })
EOF

lua require('telescope').load_extension('neoclip')

