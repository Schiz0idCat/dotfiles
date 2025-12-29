return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',

        config = function()
            local ts = require('nvim-treesitter')

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
        end,
    },

    -- uncomment when this shit works
    -- {
    --     "nvim-treesitter/nvim-treesitter-textobjects",
    --     branch = "main",
    --     init = function()
    --         -- Disable entire built-in ftplugin mappings to avoid conflicts.
    --         -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    --         vim.g.no_plugin_maps = true
    --
    --         -- Or, disable per filetype (add as you like)
    --         -- vim.g.no_python_maps = true
    --         -- vim.g.no_ruby_maps = true
    --         -- vim.g.no_rust_maps = true
    --         -- vim.g.no_go_maps = true
    --     end,
    --     config = function()
    --         -- put your config here
    --     end,
    -- }

    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { 'nvim-treesitter/nvim-treesitter' },

        config = function()
            require('treesitter-context').setup({
                enable = true,
                max_lines = 0,
                min_window_height = 0,
                line_numbers = true,
                mode = "cursor",
            })
        end,
    }
}
