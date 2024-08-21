local lsp = require("lsp-zero")
lsp.extend_lspconfig()

lsp.preset("recommended")

local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
    cmd={'/usr/bin/clangd', '-header-insertion=never'}
})

lspconfig.racket_langserver.setup{
    cmd={'racket', '-l', 'racket-langserver'}
}

lspconfig.tsserver.setup({
    cmd = {'npx', '--', 'typescript-language-server', '--stdio'}
})

local cmp = require('cmp')
local cmp_select = {behaviour = cmp.SelectBehavior.Select}

lsp.set_preferences({
	sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = 'ⓘ'
    }
})

local cmp_mappings = lsp.defaults.cmp_mappings({
	-- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
	-- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['Tab'] = cmp.mapping.select_next_item(cmp_select),
	-- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['Enter'] = cmp.mapping.confirm({ select = true }),
	-- ['<C-Space>'] = cmp.mapping.complete(),
})

cmp.setup({
    mapping = cmp.mapping.preset.insert(cmp_mappings),
    sources = {
        {name = 'nvim_lsp'}
    }
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        (function(client, bufnr)
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
            vim.keymap.set("n", "<leader>laf", function() vim.lsp.buf.format() end, opts)
            vim.keymap.set("n", "<leader>lvh", function() vim.lsp.buf.signature_help() end, opts)
        end)(args.data.client_id, args.buf)
    end
})

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {'clangd', 'bashls', 'pyright', 'lua_ls', 'ltex'},
    handlers = {
        lsp.default_setup,
        lua_ls = function()
            local lua_opts = lsp.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    },
})
