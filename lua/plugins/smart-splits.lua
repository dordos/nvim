return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    require("smart-splits").setup()

    local ss = require("smart-splits")
    vim.keymap.set("n", "<A-h>", ss.resize_left, { desc = "Resize window left" })
    vim.keymap.set("n", "<A-l>", ss.resize_right, { desc = "Resize window right" })
    vim.keymap.set("n", "<A-j>", ss.resize_down, { desc = "Resize window down" })
    vim.keymap.set("n", "<A-k>", ss.resize_up, { desc = "Resize window up" })
  end,
}
