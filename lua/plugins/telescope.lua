return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.2.0',
  dependencies = {
    'nvim-lua/plenary.nvim',

    -- FZF 加速器（C 編譯）
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
  },

  config = function()
    local telescope = require('telescope')

    telescope.setup({
      defaults = {
        -- ripgrep 設定（live_grep 使用）
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                -- 模糊比對
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",    -- fzf 的 smart-case
        },
      },
    })

    -- 啟用 FZF 加速器
    telescope.load_extension('fzf')
  end,
}

