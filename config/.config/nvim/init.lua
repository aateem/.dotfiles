require('autocmds')
require('plugins')
require('completion')
require('options')
require('mappings')
require('lsp')

-- create a function to cycle through selected colorschemes
-- vim.cmd('colorscheme onedark')
vim.cmd('colorscheme nightfox')

-- loading extensions for telescope
require('telescope').load_extension('fzf')


-- vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])


require 'nvim-treesitter.configs'.setup {
    ensure_installed = { 'python', 'lua' },
    sync_install = true,
    highlight = {
        enable = true,
    },
}
