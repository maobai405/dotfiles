---@type LazySpec
return {
  ----------------------------------------------------------------------
  --                           UI PLUGINS                             --
  ----------------------------------------------------------------------
  -- 主题 https://github.com/catppuccin/nvim
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = require "config.ui.catppuccin",
  },

  {
    "olimorris/onedarkpro.nvim",
    opts = require "config.ui.onedarkpro",
  },

  -- 启动菜单 https://github.com/goolord/alpha-nvim
  {
    "goolord/alpha-nvim",
    opts = require "config.ui.alpha-nvim",
  },

  -- 底部状态栏 https://github.com/rebelot/heirline.nvim
  {
    "rebelot/heirline.nvim",
    opts = require "config.ui.heirline",
  },

  -- 消息、命令行和弹出菜单的UI https://github.com/folke/noice.nvim
  {
    "folke/noice.nvim",
    opts = require "config.ui.noice",
  },

  -- 键位提示 https://github.com/folke/which-key.nvim
  {
    "folke/which-key.nvim",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 0
    end,
    opts = require "config.ui.which-key",
  },

  ----------------------------------------------------------------------
  --                           LSP PLUGINS                            --
  ----------------------------------------------------------------------
  -- 键入时出现 LSP 签名提示 https://github.com/ray-x/lsp_signature.nvim
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- 代码大纲code outline https://github.com/stevearc/aerial.nvim
  {
    "stevearc/aerial.nvim",
    opts = require "config.lsp.aerial",
  },

  ----------------------------------------------------------------------
  --                           CODING PLUGINS                         --
  ----------------------------------------------------------------------
  -- 代码片段 https://github.com/L3MON4D3/LuaSnip
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  -- -- 代码提示插件 https://github.com/hrsh7th/nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    opts = require "config.coding.cmp",
    dependencies = {
      { "hrsh7th/cmp-emoji" },
      { "luckasRanarison/tailwind-tools.nvim" },
      { "onsails/lspkind.nvim" },
      { "lukas-reineke/cmp-under-comparator" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "andersevenrud/cmp-tmux" },
      { "hrsh7th/cmp-path" },
      { "f3fora/cmp-spell" },
      { "hrsh7th/cmp-buffer" },
      { "kdheepak/cmp-latex-symbols" },
      { "ray-x/cmp-treesitter" },
    },
  },

  -- -- 功能齐全且增强的copilot.vim替代品，包含用于与Github Copilot交互的API https://github.com/zbirenbaum/copilot.lua
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   opts = require "config.coding.copilot",
  --   dependencies = {
  --     { "zbirenbaum/copilot-cmp", opts = {} },
  --   },
  -- },

  {
    "Exafunction/codeium.nvim",
    opts = require "config.coding.codeium",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
  },

  {
    "yetone/avante.nvim",
    opts = require "config.coding.avante",
  },

  ----------------------------------------------------------------------
  --                           EDITOR PLUGINS                         --
  ----------------------------------------------------------------------
  -- 文件系统 https://github.com/nvim-neo-tree/neo-tree.nvim
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = require "config.editor.neo-tree",
  },
  {
    "akinsho/toggleterm.nvim",
    opts = require "config.editor.toggleterm",
  },

  ----------------------------------------------------------------------
  --                           TOOLS PLUGINS                          --
  ----------------------------------------------------------------------
  -- jk 键入时立即退出插入模式 https://github.com/max397574/better-escape.nvim
  { "max397574/better-escape.nvim" },

  -- 加速jk移动 https://github.com/rainbowhxch/accelerated-jk.nvim
  {
    "rainbowhxch/accelerated-jk.nvim",
    lazy = false,
    opts = require "config.tools.accelerated-jk",
  },

  -- 自动配对插件 https://github.com/windwp/nvim-autopairs
  {
    "windwp/nvim-autopairs",
    config = require "config.tools.nvim-autopairs",
  },

  -- 快捷打开yazi https://github.com/DreamMaoMao/yazi.nvim
  {
    "DreamMaoMao/yazi.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },

  -- 获取 Neovim 中的 nerdfont 图标 https://github.com/nvimdev/nerdicons.nvim
  {
    "glepnir/nerdicons.nvim",
    cmd = "NerdIcons",
    opts = require "config.tools.nerdicons",
  },

  -- 📸 功能丰富的快照插件，可以为 Neovim 制作漂亮的代码快照 https://github.com/mistricky/codesnap.nvim
  {
    "mistricky/codesnap.nvim",
    opts = require "config.tools.codesnap",
  },

  -- tailwind-tools.nvim https://github.com/luckasRanarison/tailwind-tools.nvim
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = require "config.tools.tailwind-tools",
  },

  -- ChatGPT 插件 https://github.com/jackMort/ChatGPT.nvim
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    opts = require "config.tools.chatgpt.chat-gpt",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
