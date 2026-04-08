vim.pack.add({
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' }, -- optioinal
    { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require("nvim-tree").setup({
    diagnostics = {
        enable = true,
    },
    filters = {
        custom = { "^\\.git$" },
    },
    view = {
        width = {
            min = 0,
            max = 35,
            padding = 2,
        },
        preserve_window_proportions = true,
        side = "right",
    },
    renderer = {
        root_folder_label = false,
    },
})
