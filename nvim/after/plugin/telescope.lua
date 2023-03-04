local builtin = require('telescope.builtin')
local all_files = function() builtin.find_files({ find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" }}) end
local git_or_all = function() 
	vim.fn.system('git rev-parse --is-inside-work-tree')
	if vim.v.shell_error == 0 then builtin.git_files() else all_files() end
end

-- files/buffers
vim.keymap.set('n', '<leader>pg', git_or_all, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {}) 
vim.keymap.set('n', '<leader>pf', all_files, {}) 
vim.keymap.set('n', '<leader>pm', builtin.marks, {}) 
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {}) 
-- aux stuff
vim.keymap.set('n', '<leader>vo', builtin.vim_options, {}) 
vim.keymap.set('n', '<leader>vk', builtin.keymaps, {}) 
vim.keymap.set('n', '<leader>vc', builtin.colorscheme, {}) 
-- lsp stuff
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {}) 
