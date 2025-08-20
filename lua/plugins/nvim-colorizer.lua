return {
  {
    "eero-lehtinen/oklch-color-picker.nvim",
    event = { "BufReadPost", "BufNewFile" },
    version = "*",
    config = function()
      require("oklch-color-picker").setup({
        highlight = {
          style = "virtual_left",
        },
      })
    end,
  }
}
