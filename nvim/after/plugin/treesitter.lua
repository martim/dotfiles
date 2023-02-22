require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'css', 'fish', 'html', 'javascript', 'help', 'lua', 'python', 'regex',
        'vim'
    },
    highlight = {enable = true},
    indent = {enable = true},
    context_commentstring = {enable = true},
    autotag = {enable = true}
}
