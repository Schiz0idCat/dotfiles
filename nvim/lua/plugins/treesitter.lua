return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context"
    },
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        local context = require("treesitter-context")

        treesitter.setup({
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
            },
        })

        context.setup({
            enable = true,
            max_lines = 0,
            min_window_height = 0,
            line_numbers = true,
            mode = "cursor",
        })

        -- Auto-indent for HTML when I embebed JS and CSS
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "html", "javascript", "css" },
            callback = function()
                local opts = vim.opt_local
                opts.autoindent = true
                opts.smartindent = true
                opts.expandtab = true
                opts.shiftwidth = 4
                opts.tabstop = 4
            end,
        })
    end,
}
