local nvim_tree = require("nvim-tree")

nvim_tree.setup({
    diagnostics = {
        enable = true,
    },
    filters = {
        custom = { "^%.git$" },
    },
    view = {
        side = "right",
    },
    renderer = {
        root_folder_label = false,
    },
})
