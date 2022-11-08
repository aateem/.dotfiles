require('autocmds')
require('packages')
require('completion')
require('options')
require('keymaps')
require('lsp')


-- create a function to cycle through selected colorschemes
-- vim.cmd('colorscheme onedark')
-- vim.cmd('colorscheme duskfox')
vim.cmd 'colorscheme tokyonight'

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { 'python', 'lua' },
    sync_install = true,
    highlight = {
        enable = true,
    },
}

require 'lualine'.setup {
    options = {
        icons_enabled = false,
        theme = 'solarized_light'
    }
}

require("null-ls").setup {
    sources = {
        require "null-ls".builtins.formatting.black
    }
}

require 'telescope'.setup {
    pickers = {
        find_files = {
            theme = "ivy"
        }
    }
}
require('telescope').load_extension('fzf')
require("telescope").load_extension "file_browser"

require 'aerial'.setup {
    min_width = 35,
    max_width = 35,
}
-- require'nvim-tree'.setup {}
