-- return {
--   "navarasu/onedark.nvim",
--   priority = 1000,
--   lazy = false,
--   config = function()
--     require('onedark').setup {
--       style = 'warm',
--       transparent = true,
--       highlights = {
--         Conceal = { fg = "#c0c0c0" },
--       },
--     }
--     vim.cmd([[colorscheme onedark]])
--   end,
-- }
--
-- return {
--   "sainnhe/gruvbox-material",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -------------------
--     -- 기본 설정 옵션 --
--     -------------------
--     -- 1. 배경 설정 (배경 대비)
--     vim.g.gruvbox_material_background = 'soft' -- 'hard', 'medium', 'soft' 중 선택
--
--     -- 2. 전경색 설정 (색상 팔레트)
--     vim.g.gruvbox_material_foreground = 'material' -- 'material', 'mix', 'original' 중 선택
--
--
--     ----------------------
--     -- 스타일 관련 설정 --
--     ----------------------
--     -- 4. 이탤릭체 설정
--     -- vim.g.gruvbox_material_enable_italic = 1          -- 1: 활성화, 0: 비활성화
--     vim.g.gruvbox_material_disable_italic_comment = 0 -- 1: 주석에 이탤릭체 비활성화, 0: 활성화
--
--     -- -- 5. 볼드체 설정
--     -- vim.g.gruvbox_material_enable_bold = 1            -- 1: 활성화, 0: 비활성화
--     --
--     -- -- 6. 밑줄 설정
--     -- vim.g.gruvbox_material_current_word = 'italic'    -- 'grey background', 'bold', 'underline', 'italic', 'grey underline'
--     --
--     -- ---------------------
--     -- -- UI 관련 설정 --
--     -- ---------------------
--     -- -- 7. 투명 배경 설정
--     vim.g.gruvbox_material_transparent_background = 0 -- 1: 활성화, 0: 비활성화
--     --
--     -- -- 8. 상태 줄 배경 설정
--     -- vim.g.gruvbox_material_statusline_background = 'default'  -- 'default', 'transparent'
--     --
--     -- -- 9. 메뉴 선택 하이라이트 설정
--     -- vim.g.gruvbox_material_menu_selection_background = 'grey' -- 'grey', 'green', 'blue', 'red'
--     --
--     -- -- 10. 비활성 창 어둡게 설정
--     -- vim.g.gruvbox_material_dim_inactive_windows = 0           -- 1: 활성화, 0: 비활성화
--     --
--     -- -- 11. UI 대비 설정
--     -- vim.g.gruvbox_material_ui_contrast = 'low' -- 'low', 'high'
--     --
--     -- -- 12. 부호 칼럼 배경 설정
--     -- vim.g.gruvbox_material_sign_column_background = 'none'    -- 'default', 'none'
--     --
--     -- ---------------------
--     -- -- 플러그인 지원 설정 --
--     -- ---------------------
--     -- -- 13. 플러그인 하이라이트 그룹 지원
--     -- vim.g.gruvbox_material_plugin_hi_groups = 1                -- 1: 활성화, 0: 비활성화
--     --
--     -- -- 14. 진단(LSP) 설정
--     -- vim.g.gruvbox_material_diagnostic_text_highlight = 1       -- 1: 활성화, 0: 비활성화
--     -- vim.g.gruvbox_material_diagnostic_line_highlight = 0       -- 1: 활성화, 0: 비활성화
--     -- vim.g.gruvbox_material_diagnostic_virtual_text = 'colored' -- 'grey', 'colored', 'NONE'
--     -- -- 15. NeoVim 특정 설정
--     -- vim.g.gruvbox_material_enable_nvim_tree_bg = 0             -- 1: NvimTree 배경 활성화, 0: 비활성화
--     --
--     -- -- 16. 들여쓰기 가이드 설정
--     -- vim.g.gruvbox_material_show_eob = 1                        -- 1: 버퍼 끝 표시자 표시, 0: 숨김
--     -- vim.g.gruvbox_material_float_style = 'bright'              -- 'bright', 'dim'
--     --
--     -- -- 17. 커스텀 하이라이트 그룹
--     -- vim.g.gruvbox_material_colors_override = {
--     --   -- 예: 특정 색상 재정의(전역으로 바뀌어 jsx등 특정 요소 이외에 것도 변경됨)
--     --   -- bg0 = {'#282828', '235'},
--     --   -- red = {'#e06c75', '204'},
--     -- }
--     -- 테마 활성화 (모든 설정 이후에 실행)
--     vim.cmd("colorscheme gruvbox-material")
--     -- 추가 하이라이트 커스터마이징 (선택 사항)
--     -- vim.cmd([[
--     --   " 필요한 추가 하이라이트 설정
--     -- ]])
--     vim.api.nvim_set_hl(0, "@lsp.type.function.typescriptreact", { fg = "#85669c" })  --보라색
--
--     vim.api.nvim_set_hl(0, "@lsp.type.namespace.typescriptreact", { fg = "#dfbe81" }) --노란색
--     vim.api.nvim_set_hl(0, "@lsp.type.interface.typescriptreact", { fg = "#dfbe81" }) --노란색
--     vim.api.nvim_set_hl(0, "@type.tsx", { fg = "#dfbe81" })                           -- 노란색
--
--     vim.api.nvim_set_hl(0, "@lsp.type.parameter.typescriptreact", { fg = "#7a98ac" }) --파란색
--   end,
-- }
--
return {
  'sainnhe/everforest',
  -- priority = 1000, -- 다른 플러그인보다 먼저 로드
  config = function()
    -- 투명도 설정을 여기서 합니다
    vim.g.everforest_transparent_background = 1 -- 0: 비활성화, 1: 활성화

    -- 기타 설정 (선택 사항)
    vim.g.everforest_background = 'soft' -- hard, medium, soft
    -- vim.g.everforest_cursor = 'orange' -- 커서 색상 변경

    -- 컬러 스킴 적용
    vim.cmd.colorscheme 'everforest'

    -- 검색 텍스트 색상
    vim.api.nvim_set_hl(0, 'TelescopeMatching', {
      -- fg = '#e69875', -- 글자색 변경
      fg = '#e06c75', -- 글자색 변경
      bold = true,    -- 굵게
      -- italic = true -- 기울임꼴 (선택 사항)
    })

    -- 색상 덮어쓰기
    vim.api.nvim_set_hl(0, "@function.method.tsx", { fg = "#75A2C8" })
    vim.api.nvim_set_hl(0, "@function.method.call.tsx", { fg = "#75A2C8" })
    vim.api.nvim_set_hl(0, "@lsp.type.function.typescriptreact", { fg = "#75A2C8" })
    vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { fg = "#8984af" })
    vim.api.nvim_set_hl(0, "@lsp.type.parameter.typescriptreact", { fg = "#DEA24F" })
  end,
}
