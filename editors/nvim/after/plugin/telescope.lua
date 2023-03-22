local builtin = require("telescope.builtin")
local all_files = function()
    builtin.find_files({ find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" } })
end
local git_or_all = function()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    if vim.v.shell_error == 0 then
        builtin.git_files()
    else
        all_files()
    end
end
vim.keymap.set("n", "<leader>o", function()
    require("telescope").extensions.file_browser.file_browser({
        path = "%:p:h",
        grouped = true,
        hidden = true,
    })
end, { desc = "telescopic file br[O]wser" })
vim.keymap.set("n", "<leader>p", all_files, { desc = "ctrl-[P] files" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "[B]uffers" })
vim.keymap.set("n", "<leader>gg", builtin.git_files, { desc = "[G]rep [G]it file list" })
vim.keymap.set("n", "<leader>gm", builtin.marks, { desc = "[G]rep [M]arks" })
vim.keymap.set("n", "<leader>gk", builtin.keymaps, { desc = "[G]rep [K]eys" })
vim.keymap.set("n", "<leader>gl", builtin.live_grep, { desc = "[G]rep [L]ive" })

vim.keymap.set("n", "<leader>go", builtin.vim_options, { desc = "[G]rep vim [O]ptions" })
vim.keymap.set("n", "<leader>gc", builtin.colorscheme, { desc = "[G]rep colorscheme list" })

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
