return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[┌──────────────────────────────────┐]],
            [[│        \`*-.                     │]],
            [[│         )  _`-.                  │]],
            [[│        .  : `. .                 │]],
            [[│        : _   '  \                │]],
            [[│        ; *` _.   `*-._           │]],
            [[│        `-.-'          `-.        │]],
            [[│          ;       `       `.      │]],
            [[│          :.       .        \     │]],
            [[│          . \  .   :   .-'   .    │]],
            [[│          '  `+.;  ;  '      :    │]],
            [[│          :  '  |    ;       ;-.  │]],
            [[│          ; '   : :`-:     _.`* ; │]],
            [[│ [bug] .*' /  .*' ; .*`- +'  `*'  │]],
            [[│       `*-*   `*-*  `*-*'         │]],
            [[└──────────────────────────────────┘]],
        }

        dashboard.section.buttons.val = {
            dashboard.button("SPC f f", "󰈞  Find file"),
            dashboard.button("SPC f g", "  Find word"),
            dashboard.button("n", "  New file", "<Cmd>ene<CR>"),
            dashboard.button("q", "󰅚  Quit", "<Cmd>qa<CR>"),
        }

        alpha.setup(dashboard.opts)

        vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
    end,
}
