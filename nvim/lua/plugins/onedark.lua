return {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
        require("onedarkpro").setup({
            highlights = {
                -- lenguague: rust
                ["@lsp.typemod.variable.mutable.rust"] = { underline = true },

                -- plugin: gitsigns
                GitSignsAdd = { fg = "${green}" },
                GitSignsChange = { fg = "${yellow}" },
            },
        })
        vim.cmd("colorscheme onedark")
    end,
}
