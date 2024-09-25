---@class Mapping
---@field baseMapping table 基础键位映射
---@field lspMapping table Lsp键位映射

---@type Mapping
local M = {}
local Utils = require "utils"
local builtin = require "telescope.builtin"

-- 禁用的键位(Disable Mappings)
local disableMapping = {
  -- 基础禁用键位
  baseMapping = {
    n = {
      ["<Leader>q"] = false,
      ["<Leader>Q"] = false,
      ["<Leader>sl"] = false,
      ["<Leader>c"] = false,
      ["<Leader>C"] = false,
      ["<Leader>w"] = false,
      ["<Leader>h"] = false,
      ["<Leader>tf"] = false,
      ["<Leader>th"] = false,
      ["<Leader>tl"] = false,
      ["<Leader>tn"] = false,
      ["<Leader>tp"] = false,
      ["<Leader>tv"] = false,
      ["<Leader>un"] = false,
      ["<Leader>lf"] = false,
      ["<Leader>ld"] = false,
      ["<Leader>lD"] = false,
      ["<Leader>ls"] = false,
      ["<Leader>lS"] = false,
    },
    v = {
      ["<Leader>l"] = false,
      ["<Leader>la"] = false,
    },
  },
  -- Lsp禁用键位
  lspMapping = {
    n = {
      ["<Leader>la"] = false,
      ["<Leader>lA"] = false,
      ["<Leader>ll"] = false,
      ["<Leader>lL"] = false,
      ["<Leader>lr"] = false,
      ["<Leader>lR"] = false,
      ["<Leader>lh"] = false,
      ["<Leader>lG"] = false,
      ["<Leader>li"] = false,
      ["<Leader>lI"] = false,
      ["<Leader>lD"] = false,
      K = false,
      ["<Leader>lp"] = false,
      ["<Leader>lS"] = false,
    },
    v = {
      ["<Leader>l"] = false,
      ["<Leader>la"] = false,
      ["<Leader>lA"] = false,
      ["<Leader>lf"] = false,
    },
    x = {
      ["<Leader>la"] = false,
    },
  },
}

-- 键位映射(Key Mappings)
local keyMapping = {
  -- 基础键位映射
  baseMapping = {
    n = {
      -- 键位映射描述
      ["<Leader>t"] = { desc = "tab|tailwindcss|boolean" },
      ["<Leader>w"] = { desc = "窗口(Window)" },
      ["<Leader>b"] = { desc = "缓冲区(Buffers)" },
      ["<Leader>q"] = { desc = "退出" },
      ["<Leader>y"] = { desc = "yazi" },

      -- 基础通用映射
      ["?"] = { "*", desc = "基础映射 查询键位下关" },
      ["/"] = {
        function() builtin.current_buffer_fuzzy_find() end,
        desc = "基础映射 查询当前缓冲区键位",
      },
      ["<Leader>qq"] = { "<cmd>qa<cr>", desc = "基础映射 退出AstroNvim" },
      ["<Leader>qs"] = {
        function() require("resession").load "Last Session" end,
        desc = "基础映射 加载最后会话",
      },
      ["<Leader><Leader>"] = {
        function() builtin.find_files() end,
        desc = "查询(Find) 查找文件",
      },
      -- 保存文件
      ["<Leader>sa"] = {
        "<cmd>:w<cr>",
        desc = "查询(Find) 查找文件",
      },

      -- Yazi
      ["<Leader>yz"] = { "<cmd>Yazi<cr>", desc = "终端(Terminal) 打开Yazi" },
      -- -- Zellij
      -- ["<A-cr>"] = {
      --   ":!zellij action new-tab -l default -c " .. vim.fn.getcwd() .. "<cr>",
      --   desc = "终端(Terminal) 创建新的Zellij tab",
      -- },

      -- 窗口相关映射
      ["<Leader>ww"] = { "<C-w>p", desc = "窗口 切换到其他窗口" },
      ["<Leader>wd"] = { "<C-w>c", desc = "窗口 关闭当前窗口" },
      ["<Leader>ws"] = { "<C-w>s", desc = "窗口 向下分割当前窗口" },
      ["<Leader>wv"] = { "<C-w>v", desc = "窗口 向右分割当前窗口" },
      ["<Leader>wl"] = {
        function()
          local wins = vim.api.nvim_tabpage_list_wins(0)
          if #wins > 1 and vim.bo[vim.api.nvim_win_get_buf(wins[1])].filetype == "neo-tree" then
            vim.fn.win_gotoid(wins[2]) -- go to non-neo-tree window to toggle alpha
          end
          require("alpha").start(false)
        end,
        desc = "窗口 显示启动页",
      },

      -- tab相关映射
      ["<Leader>tn"] = { "<cmd>tabnew<cr>", desc = "Tab 创建新的tab" },
      ["<Leader>td"] = { "<cmd>tabclose<cr>", desc = "Tab 关闭当前tab" },

      -- 光标映射
      j = { "<Plug>(accelerated_jk_gj)" },
      k = { "<Plug>(accelerated_jk_gk)" },
      ["<S-j>"] = { "5j", desc = "光标(nModel) 向下移动5行" },
      ["<S-k>"] = { "5k", desc = "光标(nModel) 向上移动5行" },
      ["<A-j>"] = { "<cmd>m .+1<cr>==", desc = "光标(nModel) 向下移动行" },
      ["<A-k>"] = { "<cmd>m .-2<cr>==", desc = "光标(nModel) 向上移动行" },

      -- 缓冲区映射
      L = {
        function() require("astrocore.buffer").nav(vim.v.count1) end,
        desc = "缓冲区(Buffer) 下一个缓冲区",
      },
      H = {
        function() require("astrocore.buffer").nav(-vim.v.count1) end,
        desc = "缓冲区(Buffer) 上一个缓冲区",
      },
      ["<A-.>"] = {
        function() require("astrocore.buffer").move(vim.v.count1) end,
        desc = "缓冲区(Buffer) 缓冲区向前移动",
      },
      ["<A-,>"] = {
        function() require("astrocore.buffer").move(-vim.v.count1) end,
        desc = "缓冲区(Buffer) 缓冲区向前移动",
      },
      ["<Leader>bd"] = {
        function()
          local bufs = vim.fn.getbufinfo { buflisted = true }
          require("astrocore.buffer").close(0)
          if require("astrocore").is_available "alpha-nvim" and not bufs[2] then require("alpha").start() end
        end,
        desc = "缓冲区(Buffer) 关闭当前缓冲区",
      },
      ["<Leader>bD"] = {
        function()
          require("astrocore.buffer").close_all()
          require("alpha").start()
        end,
        desc = "缓冲区(Buffer) 关闭所有缓冲区",
      },

      -- Todo插件映射
      ["tn"] = {
        function() require("todo-comments").jump_next() end,
        desc = "待办(TODO) 下一个待办事项",
      },
      ["tp"] = {
        function() require("todo-comments").jump_prev() end,
        desc = "待办(TODO) 上一个待办事项",
      },

      -- notif
      ["<Leader>un"] = {
        function() require("notify").dismiss { silent = true, pending = true } end,
        desc = "通知(Notify) 关闭所有通知",
      },

      -- tailwindcss-tools
      ["<Leader>tt"] = { "<cmd>TailwindConcealToggle<cr>", desc = "Tailwindcss 切换Tailwindcss隐藏" },
      ["<Leader>tc"] = {
        "<cmd>TailwindColorEnable<cr>",
        desc = "Tailwindcss 启用 Tailwindcss 颜色提示",
      },
      ["<Leader>ts"] = { "<cmd>TailwindSort<cr>", desc = "Tailwindcss 排序" },
      ["<Leader>tj"] = {
        "<cmd>TailwindNextClass<cr>",
        desc = "Tailwindcss 将光标移动到下一个类点",
      },
      ["<Leader>tk"] = {
        "<cmd>TailwindPrevClass<cr>",
        desc = "Tailwindcss 将光标移动到上一个类点",
      },

      -- flutter-tools
      ["<Leader>fl"] = { "<cmd>Telescope flutter commands<cr>", desc = "显示flutter命令" },

      -- ChatGPT
      ["<Leader>ai"] = { "<cmd>ChatGPT<cr>", desc = "ChatGPT 对话显示" },
    },
    i = {
      -- 光标映射
      ["<C-b>"] = { "<ESC>^i", desc = "光标(iModel) 向上移动行" },
      ["<C-e>"] = { "<End>", desc = "光标(iModel) 向下移动行" },
      ["<C-h>"] = { "<Left>", desc = "光标(iModel) 向左移动" },
      ["<C-l>"] = { "<Right>", desc = "光标(iModel) 向右移动" },
      ["<C-j>"] = { "<Down>", desc = "光标(iModel) 向下移动" },
      ["<C-k>"] = { "<Up>", desc = "光标(iModel) 向上移动" },
      ["<A-j>"] = { "<esc><cmd>m .+1<cr>==gi", desc = "光标(iModel) 向下移动行" },
      ["<A-k>"] = { "<esc><cmd>m .-2<cr>==gi", desc = "光标(iModel) 向上移动行" },
    },
    -- Visual模式映射
    v = {
      -- 光标映射
      ["<A-j>"] = { ":m '>+1<cr>gv=gv", desc = "光标(vModel) 向下移动行" },
      ["<A-k>"] = { ":m '<-2<cr>gv=gv", desc = "光标(vModel) 向上移动行" },

      -- ChatGPT
      ["<Leader>cpe"] = { "<cmd>ChatGPTRun explain_code<cr>", desc = "ChatGpt 解释代码" },
      ["<Leader>cpf"] = { "<cmd>ChatGPTRun fix_bugs<cr>", desc = "ChatGpt 修复代码" },
      ["<Leader>cpo"] = { "<cmd>ChatGPTRun fix_bugs<cr>", desc = "ChatGpt 优化代码" },
    },
    t = {},
    -- 多Model下的键位映射
    [{ "n", "v" }] = {
      ["<Leader>h"] = { "^", desc = "光标 移动到行首" },
      ["<Leader>l"] = { "$", desc = "光标 移动到行尾" },
      -- 调用easydict翻译快捷键
      ["<Leader>mm"] = {
        function()
          local selected_text = Utils.get_text()
          os.execute("open easydict://" .. selected_text)
          vim.api.nvim_input "<Esc>"
        end,
        desc = "翻译",
      },
    },
    [{ "n", "i", "t" }] = {
      ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "终端 切换终端状态" },
    },
  },

  -- Lsp键位映射
  lspMapping = {
    n = {
      ["<Leader>c"] = {
        desc = "LSP 语言工具",
      },
      ["<Leader>ck"] = {
        function() vim.lsp.buf.hover() end,
        desc = "LSP 详情",
      },
      ["<Leader>ca"] = {
        "<cmd>Lspsaga code_action<cr>",
        -- require("actions-preview").code_actions,
        desc = "LSP 代码改进",
        cond = "testDocument/codeAction",
      },
      ["<Leader>cr"] = {
        function() vim.lsp.buf.rename() end,
        desc = "LSP 重命名当前字词",
        cond = "textDocument/rename",
      },
      ["<Leader>cd"] = {
        function() builtin.lsp_definitions {} end,
        desc = "LSP 显示当前字词的定义",
        cond = "textDocument/definition",
      },
      ["<Leader>ch"] = {
        -- function() builtin.lsp_references {} end,
        "<cmd>Lspsaga finder<cr>",
        desc = "LSP 显示当前字词的引用",
        cond = "textDocument/finder",
      },
      ["<Leader>cp"] = {
        "<cmd>Lspsaga peek_definition<cr>",
        desc = "LSP 预览当前位置代码详情",
        cond = "textDocument/finder",
      },

      ["<Leader>cs"] = {
        function() require("aerial").toggle() end,
        desc = "LSP 显示当前文件的代码大纲",
      },
      ["<Leader>cf"] = {
        function() vim.lsp.buf.format(require("astrolsp").format_opts) end,
        desc = "Format 格式化当前缓冲区",
      },
    },
    v = {},
  },
}

--- 将禁用的映射和配置的映射进行合并
--- baseMapping
M["baseMapping"] = Utils.merge_mapping(disableMapping.baseMapping, keyMapping.baseMapping)
--- lspMapping
M["lspMapping"] = Utils.merge_mapping(disableMapping.lspMapping, keyMapping.lspMapping)

return M
