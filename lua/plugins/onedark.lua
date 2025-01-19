return {
  "navarasu/onedark.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require('onedark').setup {
      style = 'warm',
<<<<<<< HEAD
=======
      transparent = true
>>>>>>> 00cd5bc (update)
    }
    vim.cmd([[colorscheme onedark]])
  end,
  --eee
}
