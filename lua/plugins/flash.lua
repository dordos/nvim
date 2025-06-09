return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  -- stylua: ignore
  keys = {
    { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
    { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,     desc = "Toggle Flash Search" },
  },

  config = function()
    require("flash").setup({
      highlight = {
        backdrop = false,
      },
      label = {
        chars = "abcdefghijklmnopqrstuvwxyz",
        extend = true,
      },
      search = {
        exclude = {
          "neo-tree",
          function(win)
            local buf = vim.api.nvim_win_get_buf(win)
            return vim.bo[buf].filetype == "neo-tree"
          end,
        },
      },
      modes = {
        char = {
          enabled = false,
        },
      },

    })
    -- 하이라이트 색상 수정

    vim.api.nvim_set_hl(0, "FlashMatch", {
      fg = "#ffffff",
      bg = "#005f87",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "FlashCurrent", {
      fg = "#ffffff",
      bg = "#9a5f6f",
      bold = true,
      underline = true,
    })

    vim.api.nvim_set_hl(0, "FlashLabel", {
      fg = "#000000",
      bg = "#5fff87", -- 밝은 연두
      bold = true,
      italic = true,
    })
  end,
}
