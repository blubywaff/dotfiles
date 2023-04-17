local lsp = require("lsp-zero")

lsp.preset("recommended")

require('lspconfig').clangd.setup({
    cmd={'-header-insertion=never'}
})

local cmp = require('cmp')
local cmp_select = {behaviour = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y'] = cmp.mapping.confirm({ select = true }),
	['<C-Space'] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = 'ⓘ'
    }
})

lsp.setup_nvim_cmp({
	mappings = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "<leader>lgd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>lvs", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>ldf", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "<leader>ldn", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "<leader>ldp", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>lac", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>lvr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>lan", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<leader>lvh", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
