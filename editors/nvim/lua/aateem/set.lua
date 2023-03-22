vim.wo.number = true

-- put new window right when vertical splitting
vim.o.splitright = true

-- (always) Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- show unprintable chars
vim.opt.list = true
vim.opt.listchars = {
    -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
    -- this breaks the script; the UTF code point is
    -- nbsp = "⦸ " ,
    tab = "»·",
    trail = "·",
}

-- tabulation
-- replace tabs with spaces
vim.o.expandtab = true
-- number of spaces to replace tab
vim.o.tabstop = 4
vim.o.softtabstop = 4
-- number of spaces inserted for indentation
vim.o.shiftwidth = 4
