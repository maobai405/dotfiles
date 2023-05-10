-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

-- ToggleTerm terminal
map("n", "<C-\\>", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "ToggleTerm horizontal" })
map("i", "<C-\\>", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "ToggleTerm horizontal" })
map("t", "<C-\\>", "<Esc><cmd>ToggleTerm direction=horizontal<cr>", { desc = "Exit ToggleTerm horizontal" })
map("n", "<leader>ft", "")
map("n", "<leader>fT", "")

-- ToggleTerm lazygit
map("n", "<leader>gg", function()
    Util.float_term({ "lazygit" }, {
        size = {
            width = 1,
            height = 1,
        },
    })
end, { desc = "Lazygit (root dir)" })

-- accelerated-jk 加速jk移动
map("n", "j", "<Plug>(accelerated_jk_gj)")
map("n", "k", "<Plug>(accelerated_jk_gk)")
