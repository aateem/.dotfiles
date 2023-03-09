local builtin = require('telescope.builtin')
local all_files = function() builtin.find_files({ find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" }}) end
local git_or_all = function()  
	vim.fn.system('git rev-parse --is-inside-work-tree')
	if vim.v.shell_error == 0 then builtin.git_files() else all_files() end
end


-- files/buffers
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {}) 
vim.keymap.set('n', '<leader>gf', builtin.git_files, {}) 
vim.keymap.set('n', '<leader>fm', builtin.marks, {}) 
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) 
-- aux stuff
vim.keymap.set('n', '<leader>fo', builtin.vim_options, {}) 
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {}) 
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {}) 
-- lsp stuff
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {}) 

vim.keymap.set("n", "<leader>o", function () 
    require"telescope".extensions.file_browser.file_browser(
		{path = "%:p:h", grouped = true, hidden = true}
	)
end
)

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
