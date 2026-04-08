vim.pack.add({
    { src = "https://github.com/akinsho/bufferline.nvim" }
})

require("bufferline").setup({
    options = {
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        themable = true,
        fit_navigation_tabs = true,
        max_name_length = 30,
        tab_size = 0,
        indicator = {
            style = 'none',
        },
    },
})
