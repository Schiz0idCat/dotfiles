local telescope = require("telescope")

telescope.setup {
    defaults = {
        layout_config = {
            horizontal = { prompt_position = "top" },
        },
        sorting_strategy = "ascending",
    },
}
