return {
    cmd = { "clangd" },
    filetypes = { "c", "cpp" },
    root_dir = require("lspconfig.util").root_pattern(".clangd", "compile_commands.json", ".git"),
}
