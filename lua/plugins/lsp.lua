-- lua/plugins/lsp.lua
return {
  -- Mason
  {
    "mason-org/mason.nvim",
    config = function() 
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
    }) 
    end,
  },

  -- mason-lspconfig: 把 mason 安裝好的 LSP 與 nvim-lspconfig 的 server 名稱對起來
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
  
    config = function()
      local servers = {
        "clangd",        -- C / C++ / CUDA
        "pyright",       -- Python
        "rust_analyzer", -- Rust
        "bashls",        -- Bash / sh
        "jsonls",        -- JSON
        "yamlls",        -- YAML
      }

      -- 1. 安裝這些 server
      require("mason-lspconfig").setup({
        ensure_installed = servers,
        -- 你也可以設 automatic_enable = true，讓 mason-lspconfig 幫你呼叫 vim.lsp.enable()
        automatic_enable = true,
      })

      ----------------------------------------------------------------------
      -- 2. 共用 on_attach / capabilities（會套用到所有 LSP）
      ----------------------------------------------------------------------
      --   local capabilities = vim.lsp.protocol.make_client_capabilities()
      --   -- 之後裝 nvim-cmp 可以改成：
      --   -- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      --   local on_attach = function(client, bufnr)
      --     local map = function(mode, lhs, rhs, desc)
      --       vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. desc })
      --     end

      --     map("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
      --     map("n", "K", vim.lsp.buf.hover, "Hover")
      --     map("n", "gr", vim.lsp.buf.references, "[G]oto [R]eferences")
      --     map("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      --     map("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      --     map("n", "<leader>ld", vim.diagnostic.open_float, "[L]ine [D]iagnostic")
      --   end

      --   -- 全部 server 的「共用預設」，用名字 '*' 代表:contentReference[oaicite:3]{index=3}
      --   vim.lsp.config("*", {
      --     on_attach = on_attach,
      --     capabilities = capabilities,
      --   })

      ----------------------------------------------------------------------
      -- 3. 個別 server 的額外設定（覆蓋或補充 nvim-lspconfig 的預設）
      ----------------------------------------------------------------------

      -- clangd：順便讓它吃 CUDA 檔案
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--background-index", "--pch-storage=memory", "--clang-tidy" },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      })

      -- 如果之後要調整 rust / python / bash 的特別設定，也可以這樣寫：
      -- vim.lsp.config("rust_analyzer", {
      --   settings = {
      --     ["rust-analyzer"] = {
      --       cargo = { allFeatures = true },
      --     },
      --   },
      -- })

      ----------------------------------------------------------------------
      -- 4. 啟用這些 server（真正 attach 到 buffer）
      ----------------------------------------------------------------------
      vim.lsp.enable(servers)
      -- 也可以一個個 vim.lsp.enable("clangd") 之類的
    end,
  },
}



