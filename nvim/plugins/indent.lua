return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = {
        "HiPhish/rainbow-delimiters.nvim",
    },
    config = function()
        local highlight = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowViolet",
            "RainbowCyan",
        }

        local hooks = require "ibl.hooks"

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        end)

        -- Custom hook scope and indent share the same color
        hooks.register(hooks.type.SCOPE_HIGHLIGHT, function(_, bufnr, scope)
            local start_row, _, _, _ = vim.treesitter.get_node_range(scope)
            local line = vim.api.nvim_buf_get_lines(bufnr, start_row, start_row + 1, false)[1]

            if not line then
                return 1
            end

            local indent = line:match("^%s*")
            local indent_length = 0
            for i = 1, #indent do
                if indent:sub(i, i) == "\t" then
                    indent_length = indent_length + (vim.bo[bufnr].tabstop or 4)
                else
                    indent_length = indent_length + 1
                end
            end

            local indent_size = vim.bo[bufnr].shiftwidth
            if indent_size == 0 then
                indent_size = vim.bo[bufnr].tabstop
            end

            local level = math.floor(indent_length / indent_size) + 1
            local num_highlights = #highlight

            return (level - 1) % num_highlights + 1
        end)


        require("ibl").setup {
            indent = { highlight = highlight },
            scope = {
                enabled = true,
                show_start = true,
                show_end = false,
                highlight = highlight,
            },
        }
    end,
}
