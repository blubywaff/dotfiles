local config = {
    cmd = {'/home/alex/.local/jdtls/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    settings = {
        java = {
            project = {
                referencedLibraries = {
                    '/home/alex/Downloads/openjfx/javafx-sdk-17.0.9/lib/javafx.base.jar',
                    '/home/alex/Downloads/openjfx/javafx-sdk-17.0.9/lib/javafx-swt.jar',
                    '/home/alex/Downloads/openjfx/javafx-sdk-17.0.9/lib/javafx.web.jar',
                    '/home/alex/Downloads/openjfx/javafx-sdk-17.0.9/lib/javafx.fxml.jar',
                    '/home/alex/Downloads/openjfx/javafx-sdk-17.0.9/lib/javafx.media.jar',
                    '/home/alex/Downloads/openjfx/javafx-sdk-17.0.9/lib/javafx.swing.jar',
                    '/home/alex/Downloads/openjfx/javafx-sdk-17.0.9/lib/javafx.controls.jar',
                    '/home/alex/Downloads/openjfx/javafx-sdk-17.0.9/lib/javafx.graphics.jar',
                },
            },
        },
    },
}
require('jdtls').start_or_attach(config)
