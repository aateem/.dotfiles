-- General purpose mapping

-- quick tab navigation
vim.keymap.set("n", '<leader>t', 'gt')
vim.keymap.set('n', '<leader>T', 'gT')

-- quick switch between recent buffers
vim.keymap.set('n', '<leader>b', '<C-^>')

-- simplified windows navigation
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

-- quick write
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')

-- make resize more convenient
vim.keymap.set("n", "<leader>+", "<cmd>vertical resize +5<cr>")
vim.keymap.set("n", "<leader>-", "<cmd>vertical resize -5<cr>")


-- plugin specific
-- TODO should be moved in to separate lua module for that
-- plugin's settings

-- NERDTree
vim.keymap.set("n", "<C-n>", "<cmd>NERDTreeToggle<cr>")

-- Telescope
vim.keymap.set('n', "<leader>p", function ()
    require 'telescope.builtin'.find_files{ find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" } }
end
)
vim.keymap.set("n", "gr", require 'telescope.builtin'.lsp_references)
vim.keymap.set("n", "gs", require 'telescope.builtin'.lsp_document_symbols)
vim.keymap.set("n", "fb", require 'telescope.builtin'.buffers)
vim.keymap.set("n", "fg", require 'telescope.builtin'.live_grep)
