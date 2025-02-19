local Theme = require('nvim-juliana.theme').Theme

local colors = require('nvim-juliana.palette').colors

---@param tbl {[string]: HighlightDefMap}
local function set_hl(tbl)
    local nvim_set_hl = vim.api.nvim_set_hl
    for group, attrs in pairs(tbl) do
        nvim_set_hl(0, group, attrs)
    end
end

local load = function()
    if vim.g.colors_name then
        vim.cmd('hi clear')
    end

    vim.cmd('highlight clear')
    vim.cmd('set t_Co=256')
    vim.g.colors_name = 'juliana'

    set_hl(Theme())
end

return {
    load = load,
    colors = colors
}
