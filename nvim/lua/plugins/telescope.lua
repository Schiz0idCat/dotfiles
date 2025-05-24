return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("plugins.config.telescope")
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("plugins.config.telescope-ui")
        end,
    },
}
