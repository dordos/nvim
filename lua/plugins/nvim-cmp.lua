-- return {
--   {
--     "hrsh7th/nvim-cmp",
--     event = { "BufReadPost", "BufNewFile" },
--     dependencies = {
--       {
--         "L3MON4D3/LuaSnip",
--         version = "v2.*",
--         build = "make install_jsregexp",
--       },
--       "saadparwaiz1/cmp_luasnip",
--       "hrsh7th/cmp-nvim-lsp",
--       "hrsh7th/cmp-buffer",
--       "hrsh7th/cmp-path",
--       "rafamadriz/friendly-snippets",
--       { "onsails/lspkind.nvim", lazy = true },
--     },
--     config = function()
--       local cmp = require("cmp")
--       local luasnip = require("luasnip")
--
--       -- load snippets
--       require("luasnip.loaders.from_vscode").lazy_load()
--
--       require("luasnip.loaders.from_vscode").lazy_load({
--         paths = { vim.fn.stdpath("config") .. "/snippets" },
--         override_priority = 1000,
--       })
--
--       cmp.setup({
--         snippet = {
--           expand = function(args)
--             luasnip.lsp_expand(args.body)
--           end,
--         },
--
--         formatting = {
--           fields = { "abbr", "kind", "menu" },
--           format = function(entry, vim_item)
--             local lspkind = require("lspkind")
--
--             -- kind 아이콘
--             local symbol = lspkind.symbol_map[vim_item.kind] or ""
--             local kind_name = vim_item.kind or ""
--             vim_item.kind = string.format("[%s %s]", symbol, kind_name)
--
--             -- menu (import path / source)
--             local detail = entry.completion_item.detail or ""
--             local from_path = detail:match("from ['\"](.-)['\"]")
--
--             if from_path then
--               vim_item.menu = from_path
--             elseif entry.source.name == "nvim_lsp" then
--               vim_item.menu = detail
--             elseif entry.source.name == "path" then
--               vim_item.menu = "[path]"
--             elseif entry.source.name == "buffer" then
--               vim_item.menu = "[buf]"
--             else
--               vim_item.menu = ""
--             end
--
--             -- === 길이 제한 ===
--             local max_abbr = 30 -- 함수/변수명 길이 제한
--             local max_menu = 25 -- 경로나 출처 길이 제한
--
--             if vim_item.abbr and #vim_item.abbr > max_abbr then
--               vim_item.abbr = string.sub(vim_item.abbr, 1, max_abbr) .. "…"
--             end
--
--             if vim_item.menu and #vim_item.menu > max_menu then
--               vim_item.menu = string.sub(vim_item.menu, 1, max_menu) .. "…"
--             end
--
--             return vim_item
--           end,
--         },
--
--
--
--         window = {
--           completion = cmp.config.window.bordered(),
--           documentation = cmp.config.window.bordered(),
--         },
--         mapping = cmp.mapping.preset.insert({
--           -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--           -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
--           -- ["<C-Space>"] = cmp.mapping.complete(), --자동완성 창 열기
--           ["<CR>"] = cmp.mapping.confirm({ select = true })
--         }),
--         -- autocompletion sources
--         sources = cmp.config.sources({
--           { name = "nvim_lsp", },                    -- lsp
--           { name = "buffer",   max_item_count = 5 }, -- text within current buffer
--           { name = "path",     max_item_count = 3 }, -- file system paths
--           { name = "luasnip",  max_item_count = 3 }, -- snippets
--         }),
--       })
--     end,
--   },
-- }

return {
  -- 자동완성 UI 플러그인
  {
    "hrsh7th/nvim-cmp",
    -- Insert 모드에 진입할 때 플러그인을 로드합니다.
    event = "InsertEnter",
    -- nvim-cmp는 다른 플러그인(소스)에 의존합니다.
    dependencies = {
      -- 스니펫 엔진
      "L3MON4D3/LuaSnip",
      -- cmp가 luasnip을 인식하기 위한 브릿지
      "saadparwaiz1/cmp_luasnip",

      -- 기타 자동완성 소스들
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- ✨✨ 우리가 성공을 확인했던 스니펫 로드 코드 ✨✨
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { vim.fn.stdpath("config") .. "/snippets" },
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        -- 자동완성 소스 설정
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- 이제 여기서 스니펫을 읽어옵니다!
          { name = "buffer" },
          { name = "path" },
        }),
        -- 단축키 등 기타 개인 설정...
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
      })
    end,
  },
}
