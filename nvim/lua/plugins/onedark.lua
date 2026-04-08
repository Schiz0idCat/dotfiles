vim.pack.add({
    "https://github.com/olimorris/onedarkpro.nvim"
})

require("onedarkpro").setup({
    highlights = {
        -- lenguague: rust
        ["@lsp.typemod.variable.mutable.rust"] = { underline = true },

        -- lenguague: java
        ["@lsp.type.modifier.java"] = { fg = "${purple}" },

        -- plugin: gitsigns
        GitSignsAdd = { fg = "${green}" },
        GitSignsChange = { fg = "${yellow}" },
    },
})

vim.cmd("colorscheme onedark")
