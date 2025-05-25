return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context"
    },
    build = ":TSUpdate",
    config = function()
        require("plugins.config.treesitter")
    end,
}
