return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local nvim_tree = require("nvim-tree")

        nvim_tree.setup({
            diagnostics = {
                enable = true,
            },
            filters = {
                custom = { ".git" },
            },
            view = {
                width = {
                    min = 0,
                    max = 60,
                    padding = 2,
                },
                preserve_window_proportions = true,
                side = "right",
            },
            renderer = {
                root_folder_label = false,
            },
        })
    end,
}
