local java_cmd = vim.fn.exepath("java")
local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. project_name

return {
    cmd = {
        jdtls_path .. "/bin/jdtls",
        "-configuration", jdtls_path .. "/config_linux",
        "-data", workspace_dir,
    },
    filetypes = { "java" },
    root_dir = require("lspconfig.util").root_pattern(
        ".git",
        "pom.xml",
        "build.gradle",
        "settings.gradle",
        "build.xml"
    ),
    settings = {
        java = {
            configuration = {
                updateBuildConfiguration = "interactive",
                runtimes = {
                    {
                        name = "JavaSE-11",
                        path = "/usr/lib/jvm/java-11-openjdk",
                    },
                    {
                        name = "JavaSE-24",
                        path = "/usr/lib/jvm/java-24-openjdk",
                    },
                },
            },
        },
    },
    init_options = {
        workspace = workspace_dir,
    },
}
