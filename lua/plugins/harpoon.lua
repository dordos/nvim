return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    -- 북마크 자동 저장 설정
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
        key = function()
          return vim.loop.cwd() -- 현재 작업 디렉토리 기준으로 저장
        end,
      },
    })

    -- Telescope 확장 기능 로딩
    require("telescope").load_extension("harpoon")

    local map = vim.keymap.set
    local list = harpoon:list()

    -- 현재 파일을 북마크에 추가
    map("n", "<leader>a", function()
      list:append()
    end, { desc = "Harpoon: Add current file" })

    -- Telescope Harpoon UI
    map("n", "<leader>hh", function()
      require("telescope").extensions.harpoon.marks()
    end, { desc = "Harpoon: Show bookmarks in Telescope" })

    -- 등록된 파일 1~4번 빠르게 이동
    map("n", "<leader>1", function() list:select(1) end, { desc = "Harpoon: Go to file 1" })
    map("n", "<leader>2", function() list:select(2) end, { desc = "Harpoon: Go to file 2" })
    map("n", "<leader>3", function() list:select(3) end, { desc = "Harpoon: Go to file 3" })
    map("n", "<leader>4", function() list:select(4) end, { desc = "Harpoon: Go to file 4" })

    -- 북마크 초기화
    map("n", "<leader>hx", function()
      list:clear()
    end, { desc = "Harpoon: Clear all bookmarks" })
  end,
}
