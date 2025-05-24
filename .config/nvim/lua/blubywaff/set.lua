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
vim.cmd [[filetype plugin on]]

-- Text Appearance
vim.opt.wrap = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 8

-- Mouse is annoying
vim.opt.mouse = ""

-- To avoid jittery margin with lsp
vim.opt.signcolumn = "yes"

-- Fold method to use treesitter (most reliable)
vim.opt.foldmethod = "expr"
vim.cmd [[ set foldexpr=nvim_treesitter#foldexpr() ]]
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.api.nvim_create_autocmd({ "BufReadPost", "BufWinEnter" }, {
  pattern = "*",
  callback = function()
    vim.schedule(function()
      vim.cmd("silent! normal! zx")
    end)
  end,
})

-- listchars=eol:§,tab:¤›,extends:»,precedes:«,nbsp:‡,trail:×
vim.cmd [[ set listchars=tab:¤›,extends:»,precedes:«,nbsp:‡,trail:× ]]
vim.cmd [[ set list ]]
-- vim.cmd [[ set fileformats=unix ]]
vim.cmd([[
  syntax match ExtraCR /\%x0d/ conceal cchar=⏎
  set conceallevel=2
]])
