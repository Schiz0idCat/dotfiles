vim.pack.add({
    {
        src = "https://github.com/kylechui/nvim-surround",
        version = vim.version.range('^4.0.0'),
    },
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/windwp/nvim-ts-autotag" },
})

local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup({
    check_ts = true,
    filetypes = { "markdown", "txt", "vimwiki" },
    map_bs = false,
})

-- Auto-pair for *
npairs.add_rules {
    Rule("*", "*", { "markdown", "txt", "vimwiki" })
        :use_regex(false)
        :replace_endpair(function()
            return "*"
        end)
        :with_move(function(opts)
            return opts.prev_char:match("%*%*") ~= nil
        end)
}
