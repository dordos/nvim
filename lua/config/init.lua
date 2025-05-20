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

-- 클립보드 활성화
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

require("config.globals")
require("config.keymaps")
require("config.options")


local plugins = "plugins"
local opts = {}

require("lazy").setup(plugins, opts)
