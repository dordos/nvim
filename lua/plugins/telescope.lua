local mapKey = require("utils.keyMapper").mapKey
-- 수평 분할시 오른쪽으로
vim.opt.splitright = true

-- 수직 분할시 아래쪽으로
vim.opt.splitbelow = true

return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      mapKey('<leader>ff', builtin.find_files)
      mapKey('<leader>fg', builtin.live_grep)
      mapKey('<leader>fb', builtin.buffers)
      mapKey('<leader>fh', builtin.help_tags)
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
