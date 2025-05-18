return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function ()
        local bufferline = require("bufferline")
        local bufferline_config = require("config.buffer-line")
        bufferline.setup(bufferline_config)
    end
}
