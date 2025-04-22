local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

nvlsp.defaults()

vim.diagnostic.config({
    update_in_insert = true, -- show errors while insertion mode
})

local servers = { "clangd", "bashls" }
vim.lsp.enable(servers)

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
end

vim.api.nvim_create_autocmd("LspAttach", { -- avoid more than one lsp instance at a time
    callback = function(args)
        local clients = vim.lsp.get_clients({ bufnr = args.buf })
        local seen = {}
        for _, client in ipairs(clients) do
            if seen[client.name] then
                vim.lsp.stop_client(client.id)
            else
                seen[client.name] = true
            end
        end
    end,
})
