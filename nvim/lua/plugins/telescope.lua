vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

vim.cmd [[packadd plenary.nvim]]
vim.cmd [[packadd telescope-fzf-native.nvim]]
vim.cmd [[packadd telescope.nvim]]

require("telescope").setup({
    defaults = {
        layout_config = {
            horizontal = { prompt_position = "top" },
        },
        sorting_strategy = "ascending",
    },
})

local map = vim.keymap.set
vim.g.mapleader = " "

local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files", silent = true })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep", silent = true })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers", silent = true })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags", silent = true })
map("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope diagnostics", silent = true })
