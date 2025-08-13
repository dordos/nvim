local mapKey = require("utils.keyMapper").mapKey

-- esc
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
-- vim.keymap.set("i", "jj", "<C-\\><C-n>", { noremap = true, silent = true })

-- Neotree toggle
mapKey('<leader>e', ':Neotree toggle<CR>')

-- pane navigation
mapKey('<C-h>', '<C-w>h') -- Left
mapKey('<C-j>', '<C-w>j') -- Down
mapKey('<C-k>', '<C-w>k') -- U:p
mapKey('<C-l>', '<C-w>l') -- Right

--하이라이트 끄기
mapKey('<leader>h', ':nohlsearch<CR>')

-- indent
mapKey('<', '<gv', 'v')
mapKey('>', '>gv', 'v')

--창 닫기
mapKey('<leader>q', '<cmd>bdelete<CR>', 'n', { desc = 'Close current buffer' })

-- 파일 저장 관련
mapKey('<Leader>w', '<cmd>write<CR>', 'n', { desc = 'Save current file' })
mapKey('<Leader>wa', '<cmd>wall<CR>', 'n', { desc = 'Save all files' })

-- 창 분할 관련
mapKey('<Leader>vs', '<cmd>vsplit<CR>', 'n', { desc = 'Split window vertically' })
mapKey('<leader>hs', "<cmd>split<CR>", 'n', { desc = "Split horizontally" })

--이전 버퍼, 다음 버퍼로 이동
-- 이전 버퍼로 이동
vim.keymap.set('n', '<leader>o', '<Cmd>bprevious<CR>', { desc = '이전 버퍼 (bprevious)' })
-- 다음 버퍼로 이동
vim.keymap.set('n', '<leader>i', '<Cmd>bnext<CR>', { desc = '다음 버퍼 (bnext)' })
-- 모든 버퍼 닫기
vim.keymap.set('n', '<leader>bda', function()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  local current = vim.fn.bufnr('%')
  for _, buf in ipairs(bufs) do
    if buf.bufnr ~= current then
      vim.cmd('bdelete ' .. buf.bufnr)
    end
  end
  print("모든 버퍼를 닫았습니다.")
end, { desc = '모든 다른 버퍼 닫기' })

--resize width 1/2
vim.keymap.set("n", "<Leader>wv", function()
  local total = vim.o.columns
  vim.cmd("vertical resize " .. math.floor(total / 2))
end, { desc = "Split window width 50%" })

--resize height 1/2
vim.keymap.set("n", "<Leader>wh", function()
  local total = vim.o.lines - vim.o.cmdheight
  vim.cmd("resize " .. math.floor(total / 2))
end, { desc = "Split window height 50%" })

-- 검색시 위치 이동방지
mapKey('*', '*N', 'n', { desc = 'Search forward without jumping' })
mapKey('#', '#N', 'n', { desc = 'Search backward without jumping' })
