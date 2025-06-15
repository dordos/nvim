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


--resize
vim.keymap.set("n", "<A-h>", "<Cmd>vertical resize +3<CR>", { desc = "Resize window left" })
vim.keymap.set("n", "<A-l>", "<Cmd>vertical resize -3<CR>", { desc = "Resize window right" })
vim.keymap.set("n", "<A-j>", "<Cmd>resize -3<CR>", { desc = "Resize window down" })
vim.keymap.set("n", "<A-k>", "<Cmd>resize +3<CR>", { desc = "Resize window up" })

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


-- 오른쪽 창을 줄여서 현재(가운데) 창을 넓힘
vim.keymap.set("n", "<A-L>", function()
  local right = vim.fn.winnr("l")
  if right ~= vim.fn.winnr() then
    vim.cmd("wincmd l")
    vim.cmd("vertical resize -3")
    vim.cmd("wincmd h")
  end
end, { desc = "Expand current window by shrinking right neighbor" })

-- 왼쪽 창을 줄여서 현재 창을 넓힘
vim.keymap.set("n", "<A-H>", function()
  local left = vim.fn.winnr("h")
  if left ~= vim.fn.winnr() then
    vim.cmd("wincmd h")
    vim.cmd("vertical resize -3")
    vim.cmd("wincmd l")
  end
end, { desc = "Expand current window by shrinking left neighbor" })



-- 검색시 위치 이동방지
mapKey('*', '*N', 'n', { desc = 'Search forward without jumping' })
mapKey('#', '#N', 'n', { desc = 'Search backward without jumping' })
