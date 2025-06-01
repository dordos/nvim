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

-- visual
opt.number = true
opt.relativenumber = true -- 상대적 라인번호
opt.termguicolors = true
opt.signcolumn = "yes"    -- 브레이크 포인트 기둥 활성화 옵션
opt.cursorline = true

-- etc
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.cmdheight = 1
opt.scrolloff = 10 -- 화면이 내려갈때 커서도 함께 내려감
opt.mouse:append("a")
