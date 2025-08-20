return {
  {
    "hrsh7th/nvim-cmp",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
      },
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "rafamadriz/friendly-snippets",
      { "onsails/lspkind.nvim", lazy = true },
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- load snippets
      require("luasnip.loaders.from_vscode").lazy_load()


      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = function(entry, vim_item)
            local lspkind = require("lspkind")

            -- kind 아이콘
            local symbol = lspkind.symbol_map[vim_item.kind] or ""
            local kind_name = vim_item.kind or ""
            vim_item.kind = string.format("[%s %s]", symbol, kind_name)

            -- menu (import path / source)
            local detail = entry.completion_item.detail or ""
            local from_path = detail:match("from ['\"](.-)['\"]")

            if from_path then
              vim_item.menu = from_path
            elseif entry.source.name == "nvim_lsp" then
              vim_item.menu = detail
            elseif entry.source.name == "path" then
              vim_item.menu = "[path]"
            elseif entry.source.name == "buffer" then
              vim_item.menu = "[buf]"
            else
              vim_item.menu = ""
            end

            -- === 길이 제한 ===
            local max_abbr = 30 -- 함수/변수명 길이 제한
            local max_menu = 25 -- 경로나 출처 길이 제한

            if vim_item.abbr and #vim_item.abbr > max_abbr then
              vim_item.abbr = string.sub(vim_item.abbr, 1, max_abbr) .. "…"
            end

            if vim_item.menu and #vim_item.menu > max_menu then
              vim_item.menu = string.sub(vim_item.menu, 1, max_menu) .. "…"
            end

            return vim_item
          end,
        },



        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
          -- ["<C-Space>"] = cmp.mapping.complete(), --자동완성 창 열기
          ["<CR>"] = cmp.mapping.confirm({ select = true })
        }),
        -- autocompletion sources
        sources = cmp.config.sources({
          { name = "nvim_lsp", },                    -- lsp
          { name = "buffer",   max_item_count = 5 }, -- text within current buffer
          { name = "path",     max_item_count = 3 }, -- file system paths
          { name = "luasnip",  max_item_count = 3 }, -- snippets
        }),
      })
    end,
  },
}
