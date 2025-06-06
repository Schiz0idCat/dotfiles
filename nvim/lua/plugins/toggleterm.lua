return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup{
            direction = "float",
            float_opts = {
                border = "rounded",
                width = function()
                    return math.floor(vim.o.columns * 0.8)
                end,
                height = function()
                    return math.floor(vim.o.lines * 0.8)
                end,
            },
            open_mapping = [[<C-\>]],
            start_in_insert = true,
            terminal_mappings = true,
        }
    end
}
