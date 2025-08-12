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
