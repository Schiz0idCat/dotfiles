local telescope = require("telescope")
local themes = require("telescope.themes")

telescope.setup {
    extensions = {
        ["ui-select"] = themes.get_dropdown {},
    },
}

telescope.load_extension("ui-select")
