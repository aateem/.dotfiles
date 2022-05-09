require('autocmds')
require('packages')
require('completion')
require('options')
require('keymaps')
require('lsp')

-- create a function to cycle through selected colorschemes
-- vim.cmd('colorscheme onedark')
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

require 'lualine'.setup {
    options = {
        icons_enabled = false
    }
}
