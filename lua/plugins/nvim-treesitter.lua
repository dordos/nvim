return {
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
      highlight = {
        enable = true,
        custom_captures = {
          -- 변수 색상
          -- vim.api.nvim_set_hl(0, "@variable", { fg = "#dd9999", bg = nil, bold = false }),
          -- vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = "#dd9999", bg = nil, bold = false })
        }


      },
      indent = { enable = true },
    })
  end
}
