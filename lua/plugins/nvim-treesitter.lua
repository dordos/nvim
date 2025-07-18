return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          'markdown',
          'markdown_inline',
          'tsx',
          'typescript',
          'php',
          'json',
          'yaml',
          'css',
          'scss',
          'html',
          'javascript',
          'lua',
          'vim',
          'vimdoc',
          'jsdoc',
          'graphql',
          'bash',
          'prisma',
          'svelte',
          'sql',
          'regex',
          'swift',
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          custom_captures = {
            -- 변수 색상
            -- vim.api.nvim_set_hl(0, "@variable", { fg = "#dd9999", bg = nil, bold = false }),
            -- vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = "#dd9999", bg = nil, bold = false })
            -- constructor 색상
            vim.api.nvim_set_hl(0, "@constructor", { fg = "#c27fd7", bg = nil, bold = false }),
            vim.cmd([[highlight NeoTreeMessage guifg=#646568 guibg=NONE]]) -- 사이드바 (hidden items 글자 색상)

          }
        },
        indent = { enable = true },
      })
    end
  },


  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = 'rainbow-delimiters.strategy.global',
          vim = 'rainbow-delimiters.strategy.local',
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
          tsx = "rainbow-parens",

        },

        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",

        },
      }
    end,
  }
}
