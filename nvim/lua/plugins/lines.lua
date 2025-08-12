return {
    {
        "lukas-reineke/indent-blankline.nvim",

        config = function()
            local ibl = require("ibl")

            ibl.setup({
                scope = {
                    show_start = false,
                    show_end = false,
                },
            })
        end,
    },
    {
        "lukas-reineke/virt-column.nvim",
        config = function()
            local virt_column = require("virt-column")

            virt_column.setup({
                virtcolumn = "120",
                char = "│",
                exclude = {
                    filetypes = { "markdown", "text", "vimwiki" },
                },
            })
        end,
    },
}
