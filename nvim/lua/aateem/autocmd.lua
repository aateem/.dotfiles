local number_toggle = vim.api.nvim_create_augroup("numberToggle", { clear = true })
vim.api.nvim_create_autocmd(
    { "BufEnter", "FocusGained" },
    { command = "set relativenumber", group = number_toggle }
)
vim.api.nvim_create_autocmd(
    { "BufLeave", "FocusLost" },
    { command = "set norelativenumber", group = number_toggle }
)
