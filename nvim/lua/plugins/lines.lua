return {
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup({
                scope = {
                    show_start = false,
                    show_end = false,
                }
            })
        end,

    },
    {
        "lukas-reineke/virt-column.nvim",
        config = function()
            require("virt-column").setup({
                virtcolumn = "120",
                char = "│",
            })
        end

    }
}
