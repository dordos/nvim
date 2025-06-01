return {
  {
    -- color 색상표 보여주는 플러그인
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup()
    end,
  },
}
