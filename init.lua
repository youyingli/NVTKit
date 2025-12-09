-- init.lua (entrypoint)
-- Leader must be set before lazy bootstrap
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- core config
require("config.options")
require("config.keymaps")
--require("config.autocmds")

-- bootstrap & load plugins with lazy.nvim
require("config.lazy")

