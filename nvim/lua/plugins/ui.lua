return {
    -- 主题 https://github.com/catppuccin/nvim
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        opts = require("config.ui.catppuccin"),
    },

    -- 主题 https://github.com/folke/tokyonight.nvim
    {
        "folke/tokyonight.nvim",
        lazy = true,
        -- opts = require("config.ui.tokyonight"),
    },

    -- 配置框架插件!!! https://github.com/LazyVim/LazyVim
    {
        "LazyVim/LazyVim",
        lazy = false,
        opts = {
            colorscheme = "catppuccin",
        },
    },

    -- 启动页面 https://github.com/goolord/alpha-nvim
    {
        "goolord/alpha-nvim",
        lazy = true,
        event = "VimEnter",
        opts = require("config.ui.alpha"),
    },

    -- 消息通知 https://github.com/rcarriga/nvim-notify
    {
        "rcarriga/nvim-notify",
        lazy = true,
        opts = require("config.ui.notify"),
    },

    -- buffer栏 https://github.com/akinsho/bufferline.nvim
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        keys = {
            { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
            { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
        },
        opts = require("config.ui.bufferline"),
    },

    -- 消息、命令行和弹出菜单的UI https://github.com/folke/noice.nvim
    {
        "folke/noice.nvim",
        lazy = true,
        opts = require("config.ui.noice"),
    },

    -- 缓冲区的Git集成 https://github.com/lewis6991/gitsigns.nvim
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        opts = require("config.ui.gitsigns"),
    },

    -- 跳转平滑滚动 https://github.com/karb94/neoscroll.nvim
    {
        "karb94/neoscroll.nvim",
        lazy = true,
        event = "BufReadPost",
        opts = require("config.ui.neoscroll"),
    },

    -- 多行跳转光标提示 https://github.com/edluffy/specs.nvim
    {
        "edluffy/specs.nvim",
        lazy = true,
        event = "CursorMoved",
        opts = require("config.ui.specs"),
    },
}
