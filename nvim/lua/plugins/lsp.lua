return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
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
