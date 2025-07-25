local lspconfig = require('lspconfig')

local lspc_def = lspconfig.util.default_config
lspc_def.capabilities = vim.tbl_deep_extend(
    'force',
    lspc_def.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

local cmp = require('cmp')
local cmp_select = {behaviour = cmp.SelectBehavior.Select}

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
        -- ['<Enter>'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = {
        {name = 'nvim_lsp'}
    },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
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

lspconfig.clangd.setup({
    cmd={'/usr/bin/clangd', '-header-insertion=never'}
})

lspconfig.racket_langserver.setup{
    cmd={'racket', '-l', 'racket-langserver'}
}

lspconfig.ts_ls.setup({
    cmd = {'npx', '--', 'typescript-language-server', '--stdio'}
})

lspconfig.pyright.setup({
    cmd = {'pyright-langserver', '--stdio'}
})

require('mason').setup()
require('mason-lspconfig').setup({
    --ensure_installed = {'bashls', 'pyright', 'lua_ls', 'ltex'},
})
