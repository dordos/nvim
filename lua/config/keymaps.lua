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
