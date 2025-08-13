-- lualine 설정 파일

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local harpoon = require("harpoon")
    local devicons = require("nvim-web-devicons")

    local function harpoon_list()
      local list = harpoon:list()
      local current_file = vim.fn.expand("%:p")
      local result = ""

      for i, item in ipairs(list.items) do
        local filename = vim.fn.fnamemodify(item.value, ":t")
        local ext = filename:match("^.+%.(.+)$") or ""
        local icon, icon_hl_group = devicons.get_icon(filename, ext, { default = true })
        local is_current = current_file == vim.fn.fnamemodify(item.value, ":p")

        -- 1. 배경으로 사용할 하이라이트 그룹 결정
        local tab_hl_group = is_current and "TabLineSel" or "TabLine"

        -- 2. devicons의 전경색(fg)과 lualine의 배경색(bg)을 가져옴
        local icon_hl_info = vim.api.nvim_get_hl_by_name(icon_hl_group, true)
        local tab_hl_info = vim.api.nvim_get_hl_by_name(tab_hl_group, true)

        local icon_fg = icon_hl_info.foreground
        local tab_bg = tab_hl_info.background

        -- 3. 두 색상을 조합하여 새로운 임시 하이라이트 그룹 생성
        local temp_hl_name = "HarpoonIcon" .. i -- 각 아이콘마다 고유한 이름 부여
        vim.api.nvim_set_hl(0, temp_hl_name, { fg = icon_fg, bg = tab_bg })

        -- 4. 새로 만든 하이라이트 그룹을 사용하여 결과 문자열 조합
        result = result .. "%#" .. temp_hl_name .. "#" .. " " .. icon .. " " .. "%*"  -- 아이콘 부분
        result = result .. "%#" .. tab_hl_group .. "#" .. i .. ":" .. filename .. " " -- 텍스트 부분 (앞 공백 제거)
      end

      return result
    end

    require("lualine").setup({
      options = {
        theme = "codedark",
        globalstatus = true,
      },
      sections = {
        lualine_c = {
          { 'filename', path = 1 },
        },
      },
      tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { harpoon_list },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      }
    })

    -- Harpoon 변경 시 자동 새로고침
    vim.api.nvim_create_autocmd("User", {
      pattern = "HarpoonListChanged",
      callback = function()
        vim.cmd("redrawtabline")
      end,
    })
  end
}
