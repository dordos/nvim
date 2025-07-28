return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
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

    -- Add current file
    map("n", "<leader>a", function()
      harpoon:list():append()
    end, { desc = "Harpoon: Add current file" })


    -- Quick select
    for i = 1, 9 do
      map("n", "<leader>" .. i, function()
        harpoon:list():select(i)
      end, { desc = "Harpoon: Go to file " .. i })
    end

    map("n", "<leader>hh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    -- 덮어쓰기 함수
    local function set_slot(slot)
      local list = harpoon:list()
      if list.items[slot] then
        list:remove_at(slot)
      end
      list:append()
    end

    -- 저장/덮어쓰기 키맵
    for i = 1, 9 do
      map("n", "<leader>a" .. i, function()
        set_slot(i)
      end, { desc = "Harpoon: Overwrite slot " .. i })
    end
  end,
}
