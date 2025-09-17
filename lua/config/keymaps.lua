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

-- 위아래 반페이지 이동시 커서 가운데 위치
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

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

-- -- 모든 버퍼 닫기
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


-- 이미지,pdf 파일 등 미리보기
vim.api.nvim_create_user_command("QuickLook", function()
  local file = vim.fn.expand("%:p")
  if file ~= "" and vim.fn.filereadable(file) == 1 then
    if file:match("%.svg$") then
      os.execute("open -a Safari " .. vim.fn.shellescape(file))
    else
      os.execute("open -a Preview " .. vim.fn.shellescape(file))
    end
  else
    print("이미지 파일이 열려있지 않습니다.")
  end
end, {})

vim.keymap.set("n", "<leader>p", ":QuickLook<CR>", { noremap = true, silent = true })




--resize width 1/2
vim.keymap.set("n", "<Leader>wv", function()
  local total = vim.o.columns
  vim.cmd("vertical resize " .. math.floor(total / 2))
end, { desc = "Split window width 50%" })

--resize height 1/2
-- vim.keymap.set("n", "<Leader>wh", function()
--   local total = vim.o.lines - vim.o.cmdheight
--   vim.cmd("resize " .. math.floor(total / 2))
-- end, { desc = "Split window height 50%" })

-- 검색시 위치 이동방지
mapKey('*', '*N', 'n', { desc = 'Search forward without jumping' })
mapKey('#', '#N', 'n', { desc = 'Search backward without jumping' })



-- -- 클립보드 활성화
vim.opt.clipboard = 'unnamedplus'
-- 삭제 명령어가 클립보드에 영향을 주지 않도록 설정
vim.keymap.set({ 'n', 'v', 'o' }, 'd', '"_d', { noremap = true })
vim.keymap.set({ 'n', 'v', 'o' }, 'D', '"_D', { noremap = true })
vim.keymap.set('n', 'dd', '"_dd', { noremap = true })

-- 변경 명령어가 클립보드에 영향을 주지 않도록 설정
vim.keymap.set({ 'n', 'v', 'o' }, 'c', '"_c', { noremap = true })
vim.keymap.set({ 'n', 'v', 'o' }, 'C', '"_C', { noremap = true })
vim.keymap.set('n', 'cc', '"_cc', { noremap = true })

-- 기타 삭제 명령어가 클립보드에 영향을 주지 않도록 설정
vim.keymap.set({ 'n', 'v' }, 'x', '"_x', { noremap = true })

-- 대문자 X는 클립보드에 복사 됨
vim.keymap.set('v', 'X', 'x', { noremap = true })

vim.keymap.set('n', 's', '"_s', { noremap = true })
vim.keymap.set('n', 'S', '"_S', { noremap = true })

-- 레지스터를 덮어쓰지 않도록 비주얼 모드에서 p 재설정
vim.keymap.set("x", "p", "\"_dP", { noremap = true, silent = true })

-- vscode에 option + up,down과 같음 (한줄 이동)
vim.keymap.set("x", "J", ":move '>+1<CR>gv=gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv=gv")

-- nvim nomal 모드에서 한글일 경우 영어로 바꿔줌 (brew im-select 설치 실행함수)
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.fn.system("im-select com.apple.keylayout.ABC")
  end
})
