return {
  "navarasu/onedark.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require('onedark').setup {
      style = 'warm',
      transparent = true,
      highlights = {
        Conceal = { fg = "#c0c0c0" }, -- hidden items 색상 변경
      },
    }
    vim.cmd([[colorscheme onedark]])
  end,
}
