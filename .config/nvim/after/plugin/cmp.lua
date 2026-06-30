require('blink.cmp').setup({
    keymap = {
        preset = 'default',
        ['<C-n>'] = { 'show', 'select_next' }
    },
    completion = {
        list = { selection = { preselect = true, auto_insert = false } },
        menu = {
            auto_show = false;
        }
    }
})
