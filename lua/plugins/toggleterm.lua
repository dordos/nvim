return {
  "akinsho/toggleterm.nvim",
  version = "*", -- 또는 특정 버전을 명시할 수 있습니다. 예: "v2.7.0"
  -- event = "VeryLazy", -- 필요에 따라 로딩 시점 조절 가능
  config = function()
    require("toggleterm").setup({
      direction = "horizontal",
      open_mapping = [[<c-\>]], -- 토글 단축키 (Ctrl + \)
      shell = vim.o.shell,      -- Neovim의 'shell' 설정을 사용
      size = 10,                -- 터미널 창의 크기 (수평일 경우 높이, 수직일 경우 너비)
    }
    )
  end,
}
