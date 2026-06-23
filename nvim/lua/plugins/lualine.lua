vim.pack.add({
    "https://github.com/nvim-lualine/lualine.nvim"
})

local colors = require("onedarkpro.helpers").get_colors()

local transparent_sections = {
    a = { bg = "NONE", bold = true },
    b = { bg = "NONE" },
    c = { bg = "NONE" },
    x = { bg = "NONE" },
    y = { bg = "NONE" },
    z = { bg = "NONE" },
}

local transparent = {
    normal   = transparent_sections,
    insert   = transparent_sections,
    visual   = transparent_sections,
    replace  = transparent_sections,
    command  = transparent_sections,
    inactive = transparent_sections,
}

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
        theme = transparent,
        ignore_focus = { "NvimTree" },
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            {
                "mode",
                color = { bg = "NONE", fg = colors.red, bold = true }
            }
        },
        lualine_b = { { "branch", color = { fg = colors.green } }, "diff", "diagnostics" },
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
        -- lualine_z = { { "location", color = { bg = "NONE", fg = colors.white } } },
        lualine_z = {
            {
                "location",
                separator = { left = '' },
                color = "LualineTransparentLocation",
            }
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
})
