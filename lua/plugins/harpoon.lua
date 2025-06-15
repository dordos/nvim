return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- 기본 설정 (필요 시 수정 가능)
    harpoon:setup()

    -- 자주 사용하는 키맵 설정
    local map = vim.keymap.set
    local list = harpoon:list()

    -- 현재 파일을 북마크에 추가
    map("n", "<leader>a", function()
      list:append()
    end, { desc = "Harpoon: Add current file" })

    -- 북마크된 파일 목록 UI 보기 (토글)
    map("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(list)
    end, { desc = "Harpoon: Toggle quick menu" })

    -- 등록된 파일 1~4번 빠르게 이동
    map("n", "<leader>1", function() list:select(1) end, { desc = "Harpoon: Go to file 1" })
    map("n", "<leader>2", function() list:select(2) end, { desc = "Harpoon: Go to file 2" })
    map("n", "<leader>3", function() list:select(3) end, { desc = "Harpoon: Go to file 3" })
    map("n", "<leader>4", function() list:select(4) end, { desc = "Harpoon: Go to file 4" })


    -- 북마크 초기화 (모든 항목 제거)
    map("n", "<leader>hx", function()
      list:clear()
    end, { desc = "Harpoon: Clear all bookmarks" })
  end,
}
