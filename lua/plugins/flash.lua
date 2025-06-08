return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  -- stylua: ignore
  keys = {
    { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
  },

  config = function()
    require("flash").setup({
      highlight = {
        backdrop = false,
      },
    })
    -- 하이라이트 색상 수정
    vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#ffffff", bg = "#ff5f5f", bold = true }) --일치하는 텍스트
    -- vim.api.nvim_set_hl(0, "FlashCurrent", { fg = "#000000", bg = "#ffff00", bold = true }) --현재 선택된 텍스트
    vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#ffffff", bg = "#5f87ff", bold = true }) -- 단축키 라벨
  end,
}
