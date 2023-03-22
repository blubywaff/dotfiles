require("symbols-outline").setup()

vim.keymap.set("n", "<leader>so", function () vim.cmd [[ SymbolsOutline ]] end)
