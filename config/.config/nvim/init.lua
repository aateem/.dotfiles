require('autocmds')
require('plugins')
require('completion')
require('options')
require('mappings')
require('lsp')

-- create a function to cycle through selected colorschemes
-- vim.cmd('colorscheme onedark')
vim.o.termguicolors = true
vim.cmd('colorscheme terafox')

-- loading extensions for telescope
require('telescope').load_extension('fzf')

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { 'python', 'lua' },
    sync_install = true,
    highlight = {
        enable = true,
    },
}
