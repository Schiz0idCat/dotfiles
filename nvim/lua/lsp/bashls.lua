return {
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash" },
    root_dir = require("lspconfig.util").root_pattern(".git"),
    settings = {
        bashIde = {
            globPattern = "*@(.sh|.inc|.bash|.command)",
        },
    },
}
