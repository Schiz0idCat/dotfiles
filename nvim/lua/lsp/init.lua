local lspconfig = require("lspconfig")

local servers = {
    "clangd",
    "pyright",
    "lua_ls"
}

for _, server in ipairs(servers) do
    -- try to load specific configurations
    local ok, config = pcall(require, "lsp." .. server)

    if not ok then
        config = {}
    end

    lspconfig[server].setup(config)
end
