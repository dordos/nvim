local keyMapper = require('utils.keyMapper').mapKey

return {
  {
     "williamboman/mason.nvim",
      config = function()
        require('mason').setup()
      end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { "lua_ls", "tsserver", "html" }
      })
    end
  },
  {
    -- 코드문 유튜브
    -- "neovim/nvim-lspconfig",
    -- config = function()
    --   local lspconfig = require('lspconfig')
    --
    --   lspconfig.lua_ls.setup({})
    --   lspconfig.sourcekit.setup({})
    --   
    --   keyMapper('K', vim.lsp.buf.hover)
    --   keyMapper('gd', vim.lsp.buf.definition)
    --   keyMapper('<leader>ca', vim.lsp.buf.code_action) --오류난 코드 지침, 제한
    --
    -- end,


      --https://wojciechkulik.pl/ios/the-complete-guide-to-ios-macos-development-in-neovim 해당 사이트에서 퍼옴
      "neovim/nvim-lspconfig",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
      
        "hrsh7th/cmp-nvim-lsp",
      {"antosha417/nvim-lsp-file-operations", config = true },

    },
      config = function()
        local lspconfig = require("lspconfig")
        local util = require("lspconfig.util")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()
        local opts = { noremap = true, silent = true }
        local on_attach = function(_, bufnr)
          opts.buffer = bufnr
     
          opts.desc = "Show line diagnostics"
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
     
          opts.desc = "Show documentation for what is under cursor"
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          keyMapper('<leader>ca', vim.lsp.buf.code_action) --오류난 코드 지침, 제한
        end
     
        lspconfig["sourcekit"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end,
  },
}

