local lualine = require("lualine")

lualine.setup({
    options = {
        theme = "horizon",
        ignore_focus = { "NvimTree" },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
            {
                "filename",
                file_status = false,
                newfile_status = false,
                symbols = {
                    modified = "",
                    readonly = "",
                    unnamed = "",
                    newfile = "",
                },
            },
            "filesize",
        },
        lualine_x = { "encoding" },
        lualine_y = { "filetype" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
    },
})
