-- lua/config/options.lua

-- Editor basics
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"

-- Tabs & indent (sane defaults for C++/Python)
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.smartindent = true

-- File handling
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true

-- Performance
vim.o.updatetime = 300
vim.o.timeoutlen = 400

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

