return {
  {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure({
        delay = 100,                                   -- 하이라이팅 지연 시간 (ms)
        filetypes_denylist = { 'NvimTree', 'packer' }, -- 특정 파일 형식 제외
      })
    end
  }

}
