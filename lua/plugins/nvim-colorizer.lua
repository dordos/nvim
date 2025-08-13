return {
  --   -- 일반 css
  --   -- {
  --   --   "norcalli/nvim-colorizer.lua",
  --   --   event = { "BufReadPost", "BufNewFile", "InsertEnter" },
  --   --   config = function()
  --   --     require("colorizer").setup({
  --   --       "*", -- 모든 파일에 적용
  --   --     }, {
  --   --       mode = "background",
  --   --       names = false,
  --   --       rgb_fn = true,
  --   --       hsl_fn = true,
  --   --       css = true,
  --   --       css_fn = true,
  --   --     })
  --   --   end,
  --   -- },
  --   -- 테일윈드 전용
  --   -- {
  --   --   "luckasRanarison/tailwind-tools.nvim",
  --   --   name = "tailwind-tools",
  --   --   build = ":UpdateRemotePlugins",
  --   --   dependencies = {
  --   --     "nvim-treesitter/nvim-treesitter",
  --   --     "nvim-telescope/telescope.nvim", -- optional
  --   --     "neovim/nvim-lspconfig",         -- optional
  --   --   },
  --   --   opts = {}                          -- your configuration
  --   -- },
  --
  {
    "eero-lehtinen/oklch-color-picker.nvim",
    event = { "BufReadPost", "BufNewFile" },
    version = "*",
    config = function()
      require("oklch-color-picker").setup({
        highlight = {
          style = "foreground+virtual_left",
        },
      })
    end,
  }
}
