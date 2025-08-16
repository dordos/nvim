return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- 마지막 창이면 닫기
      popup_border_style = "rounded",
      window = {
        position = "float",
        popup = {
          size = {
            height = "90%",
            width = "60%",
          },
        },
        mappings = {
          ["l"] = "open",       -- 디렉토리/파일 열기
          ["h"] = "close_node", -- 디렉토리 닫기
        }
      },
      -- 숨김 파일 보여주기
      filesystem = {
        filtered_items = {
          visible = true,        --숨겨진 항목 표시
          hide_dotfiles = false, --.git, .env 로 시작하는 파일 숨김 여부
        },
      },


    })
  end,

}
