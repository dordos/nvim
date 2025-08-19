return {
  "mattn/emmet-vim",
  config = function()
    vim.g.user_emmet_leader_key = '<Nop>'
    vim.g.user_emmet_mode = 'i' -- insert 모드에서 활성화

    vim.api.nvim_set_keymap(
      'i',
      '<C-Space>',
      [[<C-\><C-n>:call emmet#expandAbbr('', '')<CR>]],
      { noremap = true, silent = true }
    )
  end,
}
