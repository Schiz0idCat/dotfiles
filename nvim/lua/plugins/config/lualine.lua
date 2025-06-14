local lualine = require("lualine")

-- this will be here for when I use noice.nvim
-- local function recording_status()
--     local reg = vim.fn.reg_recording()
--     if reg == "" then
--         return ""
--     else
--         return "REC @" .. reg
--     end
-- end

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
        lualine_x = {
            -- {
            --     recording_status
            -- },
            "encoding"
        },
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
