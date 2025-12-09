-- lua/plugins/coding.lua
return {
	-- autopairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	-- comment
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- formatting (conform)
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true, -- 若該語言有 LSP，可 fallback
				},

				formatters_by_ft = {

					-- ======== C / C++ / CUDA ========
					c = { "clang-format" },
					cpp = { "clang-format" },
					cuda = { "clang-format" },

					-- ======== Python ========
					python = { "isort", "black" },

					-- ======== Shell / Bash ========
					sh = { "shfmt" },
					bash = { "shfmt" },

					-- ======== Lua ========
					lua = { "stylua" },

					-- ======== Rust ========
					rust = { "rustfmt" },

					-- ======== JavaScript / TypeScript / Web ========
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },

					-- ======== YAML ========
					yaml = { "prettier" }, -- 最穩定、跨平台設定最簡單的選擇

					-- ======== Markdown ========
					markdown = { "prettier" }, -- prettier 處理 md 效果非常好
				},
			})

			-- Auto-format on save（全語言）
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
}
