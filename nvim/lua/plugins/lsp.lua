return {
    {
        "mason-org/mason.nvim", -- packer manager
        config = function()
            require("mason").setup()
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
