return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile", "InsertEnter" },
  config = function()
    require("colorizer").setup({
      "*", -- 모든 파일에 적용
    }, {
      mode = "background",
      names = false,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
    })
  end,
}
