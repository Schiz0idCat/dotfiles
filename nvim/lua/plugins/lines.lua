vim.pack.add({
    { src = "https://github.com/lukas-reineke/virt-column.nvim" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
})

require("ibl").setup({
    scope = {
        show_start = false,
        show_end = false,
    },
})

require("virt-column").setup({
    virtcolumn = "120",
    char = "│",
    exclude = {
        filetypes = { "markdown", "text", "vimwiki" },
    },
})
