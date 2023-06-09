local dapConfig = require("config.tool.dap.nvim-dap")
local dapUiConfig = require("config.tool.dap.dap-ui")

return {
  -- 项目管理 https://github.com/ahmedkhalf/project.nvim
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
    },
    config = function(_, opts)
      require("project_nvim").setup(opts)
      require("telescope").load_extension("projects")
    end,
  },

  -- 终端 https://github.com/akinsho/toggleterm.nvim
  {
    "akinsho/toggleterm.nvim",
    cmd = {
      "ToggleTerm",
      "ToggleTermSetName",
      "ToggleTermToggleAll",
      "ToggleTermSendVisualLines",
      "ToggleTermSendCurrentLine",
      "ToggleTermSendVisualSelection",
    },
    opts = require("config.tool.toggleterm"),
  },

  -- 显示代码错误 https://github.com/abecodes/tabout.nvim
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
    opts = require("config.tool.trouble"),
  },

  -- 搜索提示栏
  {
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    opts = require("config.tool.wilder"),
    dependencies = { "romgrk/fzy-lua-native" },
  },

  ----------------------------------------------------------------------
  --                           Flutter Plugins                        --
  ----------------------------------------------------------------------
  {
    "akinsho/flutter-tools.nvim",
    event = "BufReadPost",
    opts = require("config.tool.flutter-tools"),
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
      "RobertBrunhage/flutter-riverpod-snippets",
    },
  },

  -- 运行代码插件 https://github.com/CRAG666/code_runner.nvim
  {
    "CRAG666/code_runner.nvim",
    event = "BufRead",
    keys = {
      { "<leader>r", ":RunCode<CR>", desc = "运行代码" },
    },
    opts = require("config.tool.code-runner"),
  },

  ----------------------------------------------------------------------
  --                           DAP Plugins                            --
  ----------------------------------------------------------------------
  {
    "mfussenegger/nvim-dap",
    keys = dapConfig.keys,
    config = dapConfig.config,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        keys = dapUiConfig.keys,
        config = dapUiConfig.config,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
      {
        "folke/which-key.nvim",
        opts = {
          defaults = {
            ["<leader>d"] = { name = "+debug" },
            ["<leader>da"] = { name = "+adapters" },
          },
        },
      },
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
          automatic_setup = true,
          handlers = {},
          ensure_installed = {},
        },
      },
    },
  },
}
