local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>na", mark.add_file)
vim.keymap.set("n", "<leader>nv", ui.toggle_quick_menu)
