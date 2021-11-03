

lua require'neoclip'.setup()

lua << EOF
    require('neoclip').setup()
EOF

lua require('telescope').load_extension('neoclip')

