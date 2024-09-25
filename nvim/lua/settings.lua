---@class Options
---@field theme string 主题 catppuccin, rose-pine
---@field flavour string 主题风格 latte, frappe, macchiato, mocha
---@field transparent_background boolean 背景是否透明 true | false

---@type Options
local M = {}

-- ui 相关
M.theme = "catppuccin-mocha"
-- M.theme = "onedark"
M.flavour = "mocha"
M.transparent_background = true

-- lsp 相关

return M
