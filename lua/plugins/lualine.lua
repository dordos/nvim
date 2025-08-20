-- lualine 설정 파일

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local harpoon = require("harpoon")
    local devicons = require("nvim-web-devicons")
    local theme = require('lualine.themes.everforest')

    local function harpoon_list()
      local list = harpoon:list()
      local current_file = vim.fn.expand("%:p")
      local result = ""

      -- 상단 harpoon 바로가기 바
      for i, item in ipairs(list.items) do
        -- 1. 파일명과 상위 디렉토리명 함께 뽑기
        local parent = vim.fn.fnamemodify(item.value, ":h:t") -- 상위 폴더명
        local filename = vim.fn.fnamemodify(item.value, ":t") -- 파일명
        local display_name = parent ~= "" and (parent .. "/" .. filename) or filename

        -- 2. devicons 세팅
        local ext = filename:match("^.+%.(.+)$") or ""
        local icon, icon_hl_group = devicons.get_icon(filename, ext, { default = true })
        local is_current = current_file == vim.fn.fnamemodify(item.value, ":p")

        local tab_hl_group = is_current and "TabLineSel" or "TabLine"
        local icon_hl_info = vim.api.nvim_get_hl_by_name(icon_hl_group, true)
        local tab_hl_info = vim.api.nvim_get_hl_by_name(tab_hl_group, true)

        local icon_fg = icon_hl_info.foreground
        local tab_bg = tab_hl_info.background

        local temp_hl_name = "HarpoonIcon" .. i
        vim.api.nvim_set_hl(0, temp_hl_name, { fg = icon_fg, bg = tab_bg })

        -- 3. 표시 문자열
        result = result .. "%#" .. temp_hl_name .. "#" .. " " .. icon .. " " .. "%*"
        result = result .. "%#" .. tab_hl_group .. "#" .. i .. ":" .. display_name .. " "
      end

      return result
    end


    require("lualine").setup({
      options = {
        theme = theme,
        globalstatus = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'statusline', 'winbar', 'NvimTree' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
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
