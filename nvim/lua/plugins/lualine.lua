vim.pack.add({
    "https://github.com/nvim-lualine/lualine.nvim"
})

local theme = require("onedarkpro.helpers")
local colors = theme.get_colors()

local function show_macro_recording()
    local recording_register = vim.fn.reg_recording()

    if recording_register ~= "" then
        return "Recording @" .. recording_register
    end

    return ""
end

vim.api.nvim_create_autocmd("RecordingEnter", {
    callback = function()
        require('lualine').refresh({
            place = { 'statusline' },
        })
    end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
    callback = function()
        vim.defer_fn(function()
            require('lualine').refresh({
                place = { 'statusline' },
            })
        end, 50)
    end,
})

require("lualine").setup({
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
        },
        lualine_x = { { show_macro_recording, color = { fg = colors.yellow } }, "encoding" },
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
