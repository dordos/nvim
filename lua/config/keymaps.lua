local mapKey = require("utils.keyMapper").mapKey


-- esc
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })



-- Neotree toggle
mapKey('<leader>e', ':Neotree toggle<CR>')

-- pane navigation
mapKey('<C-h>', '<C-w>h') -- Left
mapKey('<C-j>', '<C-w>j') -- Down
mapKey('<C-k>', '<C-w>k') -- U:p
mapKey('<C-l>', '<C-w>l') -- Right

-- clear search highlights
mapKey('<leader>h', ':nohlsearch<CR>')


-- indent
mapKey('<', '<gv', 'v')
mapKey('>', '>gv', 'v')

-- tab 이동
vim.keymap.set('n', '<Tab>', '<cmd>bnext<cr>', { desc = 'Next buffer/tab' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<cr>', { desc = 'Previous buffer/tab' })

--창 닫기
mapKey('<leader>q', '<cmd>bdelete<CR>', 'n', { desc = 'Close current buffer' })

-- 파일 저장 관련
mapKey('<Leader>w', '<cmd>write<CR>', 'n', { desc = 'Save current file' })
mapKey('<Leader>wa', '<cmd>wall<CR>', 'n', { desc = 'Save all files' })

-- 창 분할 관련
mapKey('<Leader>vs', '<cmd>vsplit<CR>', 'n', { desc = 'Split window vertically' })
