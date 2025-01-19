return {
  "navarasu/onedark.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require('onedark').setup {
      style = 'warm',
      transparent = true
    }
    vim.cmd([[colorscheme onedark]])
  end,
}
