return {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            render = "minimal",
            stages = "slide",
            top_down = false,
        })
        vim.notify = require("notify")
    end,
}
