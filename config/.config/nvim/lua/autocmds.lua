local trim_whitespaces = vim.api.nvim_create_augroup("trimWhitespaces", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", { command = ":%s/\\s\\+$//e", group = trim_whitespaces })

local number_toggle = vim.api.nvim_create_augroup("numberToggle", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, { command = "set relativenumber", group = number_toggle })
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, { command = "set norelativenumber", group = number_toggle })
