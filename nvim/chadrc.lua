---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "onedark",
}

M.ui = {
    tabufline = {
        order = { "buffers", "tabs", "btns" } -- no treeOffset, cause it's on the right now
    }
}

return M

