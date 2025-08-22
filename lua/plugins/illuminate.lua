-- return {
--   'RRethy/vim-illuminate',
--   config = function()
--     local general_highlight_bg = '#606060' -- 일반적인 읽기/텍스트 하이라이트
--     local write_highlight_bg = '#6A5ACD'   -- 쓰기(변수 할당 등) 하이라이트 (더 눈에 띄게)
--
--     vim.api.nvim_create_autocmd("ColorScheme", {
--       callback = function()
--         vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg = general_highlight_bg, blend = 0 })
--         vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { bg = general_highlight_bg, blend = 0 })
--         vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { bg = write_highlight_bg, blend = 0 })
--       end,
--     })
--   end,
-- }
return {
  'RRethy/vim-illuminate',
  event = 'VeryLazy',
  config = function()
    -- 플러그인의 기본 설정은 여기서 호출할 수 있습니다 (선택 사항).
    require('illuminate').configure({
      under_cursor = true,
    })

    -- 🥇 핵심: 하이라이트를 설정하는 함수를 따로 정의합니다.
    local function set_custom_highlights()
      -- vim.api.nvim_set_hl() 함수를 사용하는 것이 가장 안정적입니다.
      -- { bg = '색상' } 형태로 원하는 색상을 지정합니다.
      vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg = '#606060' })
      vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { bg = '#606060' })
      vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { bg = '#6A5ACD' })
    end

    -- 🥈 Neovim의 색상 스킴이 변경될 때마다(ColorScheme 이벤트 발생 시)
    --    위에서 만든 함수(set_custom_highlights)를 실행하도록 자동 명령을 등록합니다.
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*', -- 모든 색상 스킴에 대해
      callback = set_custom_highlights,
    })

    -- 🥉 최초 로드 시에도 한번 실행해 줍니다.
    set_custom_highlights()
  end,
}
