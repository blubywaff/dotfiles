-- Line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Tabs | Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.foldmethod = "syntax"

-- File options
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Text Appearance
vim.opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 8

-- Mouse is annoying
vim.opt.mouse = ""
