vim.g.mapleader = ' '

vim.wo.number = true

vim.opt.list = true
vim.opt.listchars = {
    -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
    -- this breaks the script; the UTF code point is
    -- nbsp = "⦸ " ,
    tab = "»·",
    trail = "·"
}

vim.o.hidden = true

vim.o.scrolloff = 3

-- limit number of chars in line that are colorized
vim.o.synmaxcol = 256

-- vim.o.list = true

-- ignore search case
vim.o.ignorecase = true

-- match upper case when it is specified
vim.o.smartcase = true

-- you can move your cursor through every position in text
vim.o.virtualedit = "all"

-- show what mode you are in
vim.o.showmode = true

-- highlight line cursor pos
vim.o.cursorline = true

-- highlight column cursor pos
vim.o.cursorcolumn = true

-- put new window below when horizontal splitting
vim.o.splitbelow = true

-- put new window right when vertical splitting
vim.o.splitright = true

-- replace tabs with spaces
vim.o.expandtab = true

-- number of spaces to replace tab
vim.o.tabstop = 4

vim.o.softtabstop = 4

-- number of spaces inserted for indentation
vim.o.shiftwidth = 4

vim.o.wildmenu = true

vim.o.undolevels = 2048

vim.o.background = "dark"

-- enable mouse support
vim.o.mouse = "a"

-- always reserve a column for signs
vim.wo.signcolumn = "yes"

-- main purpose - write swap file more frequently,
-- but also infuences behavior of some plugins
vim.o.updatetime = 100

-- this might be invlolved in the tmux 256 color
-- handling
vim.o.termguicolors = true
