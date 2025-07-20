local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

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
vim.keymap.set({ 'n', 'v' }, 'X', '"_X', { noremap = true })
vim.keymap.set('n', 's', '"_s', { noremap = true })
vim.keymap.set('n', 'S', '"_S', { noremap = true })

-- vscode에 option + up,down과 같음 (한줄 이동)
vim.keymap.set("x", "J", ":move '>+1<CR>gv=gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv=gv")

-- nvim nomal 모드에서 한글일 경우 영어로 바꿔줌 (brew im-select 설치 실행함수)
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.fn.system("im-select com.apple.keylayout.ABC")
  end
})


require("config.options")
require("config.globals")
require("config.keymaps")


-- 색상 테마가 로드될 때마다 실행될 오토커맨드를 설정합니다.
local augroup = vim.api.nvim_create_augroup("MyLineNrCustomColors", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  group = augroup,
  callback = function()
    -- line 관련 색상
    vim.api.nvim_set_hl(0, "LineNr", {
      fg = "#E5C07B",
      bg = "NONE"
    })
    vim.api.nvim_set_hl(0, "CursorLineNr", {
      fg = "#BE5046",
      bg = "NONE",
      bold = true
    })


    -- 검색 관련 색상
    vim.api.nvim_set_hl(0, "Search", {
      fg = "#ffffff",
      bg = "#005f87",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "CurSearch", {
      fg = "#ffffff",
      bg = "#E06C75",
      bold = true,
    })
    vim.api.nvim_set_hl(0, "IncSearch", {
      fg = "#ffffff",
      bg = "#9a5f6f",
      bold = true,
    })
  end,
})

local plugins = "plugins"
local opts = {}

require("lazy").setup(plugins, opts)
