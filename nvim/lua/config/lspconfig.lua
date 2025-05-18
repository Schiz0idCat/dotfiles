local M = {}

function M.setup()
    vim.diagnostic.config({
        underline = true,
        signs = true,
        virtual_text = false,
        virtual_lines = true,
        update_in_insert = true,
    })

    vim.api.nvim_create_augroup("ToggleVirtualLines", { clear = true })

    vim.api.nvim_create_autocmd("InsertEnter", {
        group = "ToggleVirtualLines",
        callback = function()
            vim.diagnostic.config({
                virtual_lines = false,
                virtual_text = false,
            })
        end,
    })

    vim.api.nvim_create_autocmd("InsertLeave", {
        group = "ToggleVirtualLines",
        callback = function()
            vim.defer_fn(function()
                vim.diagnostic.config({
                    virtual_lines = true,
                    virtual_text = false,
                })
            end, 100)
        end,
    })
end

return M
