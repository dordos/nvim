local opt = vim.opt

-- tab/indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- search
opt.incsearch = true  --검색되는 즉시 알려줌
opt.ignorecase = true -- 대소문자 구분하지 않고
opt.smartcase = true  -- 검색어에 대소문자 포함하는 것을 구분함
opt.wrapscan = false  -- 검색이 파일 끝/처음에 도달해도 순환하지 않음

-- visual
opt.number = true
opt.relativenumber = true -- 상대적 라인번호
opt.termguicolors = true
opt.signcolumn = "yes"    -- 브레이크 포인트 기둥 활성화 옵션
opt.cursorline = false

-- etc
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.cmdheight = 1
opt.mouse:append("a")


-- color
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
