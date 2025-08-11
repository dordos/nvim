return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("lualine").setup({
      options = {
        theme = "codedark"
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1, -- 1: 부모 폴더, 2: 부모의 부모 폴더까지 표시
          }
        },
      }
    })
  end
}
