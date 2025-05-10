local keyMapper = require("utils.keyMapper").mapKey

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "html", "eslint" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      vim.diagnostic.config({
        -- 가상 텍스트 활성화 (코드 옆에 인라인으로 표시)
        virtual_text = {
          prefix = '●', -- 또는 다른 기호: '■', '▎', '▌'
          spacing = 4,
          source = "if_many",
        },
        -- 줄 번호 옆에 아이콘 표시
        signs = true,
        -- 문제가 있는 텍스트에 밑줄 표시
        underline = true,
        -- 삽입 모드에서는 업데이트 안 함
        update_in_insert = false,
        -- 심각도별로 정렬
        severity_sort = true,
      })

      lspconfig.lua_ls.setup({})
      lspconfig.html.setup({})
      lspconfig.eslint.setup({})

      keyMapper("K", vim.lsp.buf.hover)
      keyMapper("gd", vim.lsp.buf.definition)
      keyMapper("<leader>ca", vim.lsp.buf.code_action)
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    -- 향상된 ts 서버 lsp
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opt = {}
  },
}
