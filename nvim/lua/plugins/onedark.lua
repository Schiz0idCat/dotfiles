return {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
        require("onedarkpro").setup({
            highlights = {
                ["@lsp.typemod.variable.mutable.rust"] = { underline = true },
            },
        })
        vim.cmd("colorscheme onedark")
    end,
}
