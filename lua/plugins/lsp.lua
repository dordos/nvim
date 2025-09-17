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
        ensure_installed = { "lua_ls", "ts_ls", "html", "eslint", "tailwindcss" },
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
        float = {
          border = "rounded", -- 팝업창에 둥근 테두리를 추가합니다.
          source = "if_many", -- 에러 소스(예: eslint)를 보여줍니다.
          max_width = 80,     -- 팝업창의 최대 너비를 80자로 제한합니다.
        },
      })

      lspconfig.lua_ls.setup({})
      lspconfig.eslint.setup({
        workingDirectories = { mode = "auto" }
      })
      lspconfig.tailwindcss.setup({
        root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.cjs", "postcss.config.js",
          "package.json", ".git"),
      })

      keyMapper("K", vim.lsp.buf.hover)
      keyMapper("gd", require('telescope.builtin').lsp_definitions)
      keyMapper("gr", require('telescope.builtin').lsp_references) -- 참조 찾기
      keyMapper("gl", vim.diagnostic.open_float)
      keyMapper("<leader>ca", vim.lsp.buf.code_action)
    end,
  },
}
