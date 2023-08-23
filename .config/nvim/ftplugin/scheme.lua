print("Hello. Scheme")
vim.lsp.start({
    name = "Racket Language Server",
    cmd = {"racket", "-l", "racket-langserver"},
})
