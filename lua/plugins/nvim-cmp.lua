return {
  {
    "hrsh7th/nvim-cmp",
    -- event = { "BufReadPost", "BufNewFile" },
    event = 'InsertEnter',
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

      -- friendly-snippets 로드
      require("luasnip.loaders.from_vscode").lazy_load()

      -- 커스텀 스니펫 로드 (여러 방법 시도)
      local custom_path = vim.fn.stdpath("config") .. "/snippets"
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { custom_path },
        override_priority = 2000
      })

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
-- return {
--   {
--     "hrsh7th/nvim-cmp",
--     event = "InsertEnter", -- BufReadPost -> InsertEnter로 변경
--     dependencies = {
--       {
--         "L3MON4D3/LuaSnip",
--         version = "v2.*",
--         build = "make install_jsregexp",
--         -- ✅ 별도 설정으로 분리
--       },
--       "saadparwaiz1/cmp_luasnip",
--       "hrsh7th/cmp-nvim-lsp",
--       "hrsh7th/cmp-buffer",
--       "hrsh7th/cmp-path",
--       "rafamadriz/friendly-snippets",
--       { "onsails/lspkind.nvim", lazy = true },
--     },
--     config = function()
--       -- ===== 🚨 중요: 여기서 스니펫 로드 =====
--       local luasnip = require("luasnip")
--
--       -- friendly-snippets 로드
--       require("luasnip.loaders.from_vscode").lazy_load()
--
--       -- 커스텀 스니펫 로드 (여러 방법 시도)
--       local custom_snippets_path = vim.fn.stdpath("config") .. "/lua/snippets"
--
--       -- 방법 1: lazy_load
--       pcall(function()
--         require("luasnip.loaders.from_vscode").lazy_load({
--           paths = { custom_snippets_path }
--         })
--       end)
--
--       -- 방법 2: load (즉시 로드)
--       pcall(function()
--         require("luasnip.loaders.from_vscode").load({
--           paths = { custom_snippets_path }
--         })
--       end)
--
--       -- 방법 3: 수동으로 직접 추가
--       -- luasnip.add_snippets("all", {
--       --   luasnip.snippet("mytest", {
--       --     luasnip.text_node("이 스니펫이 보인다면, 성공입니다!")
--       --   })
--       -- })
--
--       -- ===== CMP 설정 =====
--       local cmp = require("cmp")
--
--       cmp.setup({
--         snippet = {
--           expand = function(args)
--             luasnip.lsp_expand(args.body)
--           end,
--         },
--
--         formatting = {
--           format = function(entry, vim_item)
--             -- 간단하게 소스만 표시
--             if entry.source.name == "luasnip" then
--               vim_item.menu = "[Snippet]"
--             elseif entry.source.name == "nvim_lsp" then
--               vim_item.menu = "[LSP]"
--             elseif entry.source.name == "buffer" then
--               vim_item.menu = "[Buffer]"
--             elseif entry.source.name == "path" then
--               vim_item.menu = "[Path]"
--             end
--             return vim_item
--           end,
--         },
--
--         window = {
--           completion = cmp.config.window.bordered(),
--           documentation = cmp.config.window.bordered(),
--         },
--
--         mapping = {
--           ["<Tab>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--               cmp.select_next_item()
--             elseif luasnip.expand_or_jumpable() then
--               luasnip.expand_or_jump()
--             else
--               fallback()
--             end
--           end, { "i", "s" }),
--
--           ["<S-Tab>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--               cmp.select_prev_item()
--             elseif luasnip.jumpable(-1) then
--               luasnip.jump(-1)
--             else
--               fallback()
--             end
--           end, { "i", "s" }),
--
--           ["<CR>"] = cmp.mapping.confirm({ select = true }),
--           ["<C-Space>"] = cmp.mapping.complete(),
--         },
--
--         -- ===== 소스 순서 (스니펫을 맨 앞으로) =====
--         sources = {
--           { name = "luasnip" },
--           { name = "nvim_lsp" },
--           { name = "buffer" },
--           { name = "path" },
--         },
--       })
--
--       -- ===== 디버깅 명령어들 =====
--       -- vim.api.nvim_create_user_command("SnippetTest", function()
--       --   print("=== 스니펫 테스트 ===")
--       --   print("LuaSnip 로드됨:", pcall(require, "luasnip"))
--       --   print("스니펫 경로:", custom_snippets_path)
--       --   print("파일 존재:", vim.fn.filereadable(custom_snippets_path .. "/all.json"))
--       --
--       --   local available = luasnip.available()
--       --   print("로드된 스니펫:")
--       --   for ft, snips in pairs(available) do
--       --     for _, snip in ipairs(snips) do
--       --       if snip.trigger == "mytest" then
--       --         print("  ✅ mytest 발견! (filetype: " .. ft .. ")")
--       --       end
--       --     end
--       --   end
--       -- end, {})
--
--       -- vim.api.nvim_create_user_command("SnippetForce", function()
--       --   -- 강제로 스니펫 추가
--       --   luasnip.add_snippets("all", {
--       --     luasnip.snippet("mytest", {
--       --       luasnip.text_node("강제로 추가된 스니펫입니다!")
--       --     })
--       --   })
--       --   print("스니펫 강제 추가 완료!")
--       -- end, {})
--     end,
--   },
-- }
