return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
        key = function()
          return vim.loop.cwd()
        end,
      },
    })

    require("telescope").load_extension("harpoon")

    local map = vim.keymap.set

    -- 1. 파일 추가 (가장 중요하고 안정적인 기능)
    map("n", "<leader>a", function()
      harpoon:list():append()
    end, { desc = "Harpoon: Add file" })

    -- 2. UI 토글 (목록 확인 및 관리)
    map("n", "<leader>hh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon: Toggle UI" })

    -- 3. 목록의 파일로 바로 이동
    for i = 1, 9 do
      map("n", "<leader>" .. i, function()
        harpoon:list():select(i)
      end, { desc = "Harpoon: Go to file " .. i })
    end
  end,
}
