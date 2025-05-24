return {
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins.config.indent-blankline")
        end,
    },
    {
        "lukas-reineke/virt-column.nvim",
        config = function()
            require("plugins.config.virt-column")
        end,
    },
}
