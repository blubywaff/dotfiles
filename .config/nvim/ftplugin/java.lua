local config = {
    cmd = {'/home/alex/.local/jdtls/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    settings = {
        java = {
            project = {
            },
        },
    },
}
require('jdtls').start_or_attach(config)
