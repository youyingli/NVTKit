-- lua/config/keymaps.lua
local km = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Basic mappings
km("n", "<leader>w", ":w<CR>", opts)
km("n", "<leader>q", ":q<CR>", opts)
km("n", "<leader>W", ":%bd|e#|bd#<CR>", opts) -- close other buffers
km("n", "<leader>sv", ":source $MYVIMRC<CR>", opts)

-- Telescope shortcuts
km("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
km("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
km("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
km("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

-- Neo-tree
km("n", "<leader>e", ":Neotree toggle reveal<CR>", opts)

-- LSP
km("n", "gd", vim.lsp.buf.definition, opts)
km("n", "gD", vim.lsp.buf.declaration, opts)
km("n", "gi", vim.lsp.buf.implementation, opts)
km("n", "gr", vim.lsp.buf.references, opts)
km("n", "<leader>rn", vim.lsp.buf.rename, opts)
km("n", "<leader>ca", vim.lsp.buf.code_action, opts)
km("n", "K", vim.lsp.buf.hover, opts)

-- Avante (placeholders; actual functions exist if plugin loaded)
--km("n", "<leader>ar", function() pcall(require, "avante").run end, { desc = "Avante: Run agent" })
--km("v", "<leader>ae", function() pcall(require, "avante").edit_selection end, { desc = "Avante: Edit selection" })
--km("n", "<leader>ax", function() pcall(require, "avante").explain end, { desc = "Avante: Explain" })

km("n", "<leader>ar", function()
  local ok, avante = pcall(require, "avante")
  if ok then avante.run() end
end, { desc = "Avante: Run agent" })

km("v", "<leader>ae", function()
  local ok, avante = pcall(require, "avante")
  if ok then avante.edit_selection() end
end, { desc = "Avante: Edit selection" })

km("n", "<leader>ax", function()
  local ok, avante = pcall(require, "avante")
  if ok then avante.explain() end
end, { desc = "Avante: Explain" })






-- Quick terminal toggle
km("n", "<leader>t", ":split | terminal<CR>", opts)

