
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>nx", vim.cmd.Ex)
vim.keymap.set("n", "<leader>wsv", function () vim.cmd("vs") end)
vim.keymap.set("n", "<leader>wsh", function () vim.cmd("sp") end)
vim.keymap.set("n", "<leader>wnh", function () vim.cmd("new") end)
vim.keymap.set("n", "<leader>wnv", function () vim.cmd("vnew") end)
vim.keymap.set("n", "<leader>wo", function () vim.cmd("on") end)
vim.keymap.set("n", "<leader>wo!", function () vim.cmd("on!") end)
vim.keymap.set("n", "<leader>wh", function () vim.cmd("winc h") end)
vim.keymap.set("n", "<leader>wj", function () vim.cmd("winc j") end)
vim.keymap.set("n", "<leader>wk", function () vim.cmd("winc k") end)
vim.keymap.set("n", "<leader>wl", function () vim.cmd("winc l") end)
vim.keymap.set("n", "<leader>wH", function () vim.cmd("winc H") end)
vim.keymap.set("n", "<leader>wJ", function () vim.cmd("winc J") end)
vim.keymap.set("n", "<leader>wK", function () vim.cmd("winc K") end)
vim.keymap.set("n", "<leader>wL", function () vim.cmd("winc L") end)
vim.keymap.set("n", "<leader>tn", function () vim.cmd("tabnew") end)
vim.keymap.set("n", "<leader>tl", function () vim.cmd("tabn") end)
vim.keymap.set("n", "<leader>th", function () vim.cmd("tabp") end)
vim.keymap.set("n", "<leader>tH", function () vim.cmd("-tabm") end)
vim.keymap.set("n", "<leader>tL", function () vim.cmd("+tabm") end)
vim.keymap.set("n", "<leader>u", function () vim.cmd("UndotreeToggle"); vim.cmd("UndotreeFocus") end)

vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<c-d>", "<c-d>zz")

vim.cmd [[nnoremap <expr> j v:count ? 'j' : 'gj']]
vim.cmd [[nnoremap <expr> k v:count ? 'k' : 'gk']]

vim.keymap.set("i", "<c-BS>", "<c-o>b<c-o>dw")

-- Print warning for lsp keybinds when not attached.
local warnf = function() print("LSP not attached!") end
local opts = {}
vim.keymap.set("n", "<leader>lgd", warnf, opts)
vim.keymap.set("n", "<leader>lh", warnf, opts)
vim.keymap.set("n", "<leader>lvs", warnf, opts)
vim.keymap.set("n", "<leader>ldf", warnf, opts)
vim.keymap.set("n", "<leader>ldn", warnf, opts)
vim.keymap.set("n", "<leader>ldp", warnf, opts)
vim.keymap.set("n", "<leader>lac", warnf, opts)
vim.keymap.set("n", "<leader>lvr", warnf, opts)
vim.keymap.set("n", "<leader>lan", warnf, opts)
vim.keymap.set("n", "<leader>laf", warnf, opts)
vim.keymap.set("n", "<leader>lvh", warnf, opts)
