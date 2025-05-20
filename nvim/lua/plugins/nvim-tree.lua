return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            diagnostics = {
                enable = true,
            },
            -- git = {
            --     enable = true,
            --     ignore = true,
            --     timeout = 100,
            -- },
            filters = {
                custom = { "^\\.git$" }
            },
            view = {
                side = "right",
            },
            renderer = {
                root_folder_label = false,
            },
        })
    end,
}

