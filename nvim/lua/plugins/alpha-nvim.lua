return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require("plugins.config.alpha-nvim")
    end,
}
