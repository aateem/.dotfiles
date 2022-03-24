local trim_whitespaces = vim.api.nvim_create_augroup("trimWhitespaces", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", { command = ":%s/\\s\\+$//e", group = trim_whitespaces })

local number_toggle = vim.api.nvim_create_augroup("numberToggle", { clear = true })
local num_toggle_spec = {
    BufEnter = "set relativenumber",
    FocusGained = "set relativenumber",
    BufLeave = "set norelativenumber",
    FocusLost = "set norelativenumber",
}
for action, cmd in pairs(num_toggle_spec) do
    vim.api.nvim_create_autocmd(action, { command = cmd, group = number_toggle })
end
