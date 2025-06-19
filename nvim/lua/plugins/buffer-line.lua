return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function ()
        local colors = require("config.palette")
        local bufferline = require("bufferline")

        bufferline.setup {
            options = {
                style_preset = bufferline.style_preset.no_bold,
                numbers = function(opts)
                    return string.format('%s', opts.raise(opts.ordinal))
                end,
            },
            highlights = {
                fill = {
                    fg = colors.dark_gray,
                    bg = colors.dark_gray,
                },
                separator_selected = {
                    fg = colors.dark_gray,
                },
                separator_visible = {
                    fg = colors.dark_gray,
                },
                separator = {
                    fg = colors.dark_gray,
                },
                indicator_selected = {
                    fg = colors.white_blue,
                },
            },
        }
    end
}
