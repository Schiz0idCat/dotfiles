return {
    {
        "mason-org/mason.nvim", -- packer manager
        config = function()
            require("mason").setup()
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim", -- formaters automatic install
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "clang-format", -- c
                    "shfmt",        -- sh
                    "yapf",         -- python
                    "isort",        -- python imports
                    "stylua",       -- lua
                },
                auto_install = true,
                auto_update = true,
            })
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "bashls",
                    "pyright",
                    "lua_ls",
                },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
            -- require("lspconfig").clangd.setup({ capabilities = capabilities })
            -- require("lspconfig").bashls.setup({ capabilities = capabilities })
            -- require("lspconfig").pyright.setup({ capabilities = capabilities })
            -- require("lspconfig").lua_ls.setup({ capabilities = capabilities })

            require("lspconfig").clangd.setup({})
            require("lspconfig").bashls.setup({})
            require("lspconfig").pyright.setup({})
            require("lspconfig").lua_ls.setup({})
        end,
    },
    {
        'nvimtools/none-ls.nvim',
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.clang_format,
                    null_ls.builtins.formatting.shfmt,
                    null_ls.builtins.formatting.yapf,
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.stylua,
                },
            })
        end
    }
}
