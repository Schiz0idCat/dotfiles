return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            local telescope = require("telescope")

            telescope.setup {
                defaults = {
                    layout_config = {
                        horizontal = { prompt_position = "top" },
                    },
                    sorting_strategy = "ascending",
                },
            }
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            local telescope = require("telescope")
            local themes = require("telescope.themes")

            telescope.setup {
                extensions = {
                    ["ui-select"] = themes.get_dropdown {},
                },
            }

            telescope.load_extension("ui-select")
        end,
    },
}
