vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    -- { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" }, -- it doesn't work
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
})

local ts = require('nvim-treesitter')

ts.setup {
    -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
    install_dir = vim.fn.stdpath('data') .. '/site'
}

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        local ft = vim.bo.filetype
        if ft == "" then return end

        -- Check the avaliable parser
        local available = ts.get_available()
        local installed = ts.get_installed()

        -- If there is a parser, then install it
        if vim.tbl_contains(available, ft) then
            if not vim.tbl_contains(installed, ft) then
                -- this attempt to start treesitter after the parser installation
                -- but doesn't works
                ts.install({ ft }):next(function()
                    vim.treesitter.start()
                end)
            else
                vim.treesitter.start()
            end
        end
    end,
})


-- IT DOESN'T WORK
-- require("nvim-treesitter-textobjects").setup({
--     select = {
--             enable = true,
--             lookahead = true,
--             keymaps = {
--                 ["af"] = "@function.outer",
--                 ["if"] = "@function.inner",
--                 ["ac"] = "@class.outer",
--                 ["ic"] = "@class.inner",
--             },
--             selection_modes = {
--                 ['@function.outer'] = 'V',
--                 ['@class.outer'] = 'V',
--             },
--         },
-- })

require("treesitter-context").setup({
    enable = true,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,
    mode = "cursor",
})
