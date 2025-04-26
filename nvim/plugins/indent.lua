return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = {
        "HiPhish/rainbow-delimiters.nvim",
    },
    opts = {
        indent = {
            char = "│",
            highlight = { "IblIndent" },
        },
        whitespace = {
            highlight = { "IblWhitespace" },
        },
        scope = {
            enabled = true,
            show_start = true,
            show_end = true,
            highlight = {
                "RainbowDelimiterRed",
                "RainbowDelimiterYellow",
                "RainbowDelimiterBlue",
                "RainbowDelimiterOrange",
                "RainbowDelimiterGreen",
                "RainbowDelimiterViolet",
                "RainbowDelimiterCyan",
            },
        },
    },
    config = function(_, opts)
        -- Definimos los highlights básicos para las líneas de indentación
        vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b4261" })
        vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "#3b4261" })

        -- Setup después de los highlights
        require("ibl").setup(opts)
    end,
}

