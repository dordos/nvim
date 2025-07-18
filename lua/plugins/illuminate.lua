-- vim-illuminate 플러그인 설정 (lazy.nvim 사용 시)
return {
  'RRethy/vim-illuminate',
  -- 선택 사항: 기본 설정을 변경하려면 여기에 추가
  config = function()
    local general_highlight_bg = '#606060' -- 일반적인 읽기/텍스트 하이라이트
    local write_highlight_bg = '#6A5ACD'   -- 쓰기(변수 할당 등) 하이라이트 (더 눈에 띄게)

    vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg = general_highlight_bg, blend = 0 })
    vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { bg = general_highlight_bg, blend = 0 })
    vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { bg = write_highlight_bg, blend = 0 })
  end,
}
