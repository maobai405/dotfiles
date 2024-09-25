-- 社区插件 https://github.com/AstroNvim/astrocommunity

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.colorscheme.catppuccin" }, -- 猫布奇主题
  { import = "astrocommunity.colorscheme.rose-pine" }, -- https://github.com/rose-pine/neovim
  { import = "astrocommunity.code-runner.sniprun" }, -- 代码运行 https://github.com/michaelb/sniprun

  { import = "astrocommunity.motion.flash-nvim" }, -- 加速jk移动 https://github.com/rainbowhxch/accelerated-kk.nvim
  { import = "astrocommunity.editing-support.vim-visual-multi" }, -- 多光标操作插件 https://github.com/mg979/vim-visual-multi
  { import = "astrocommunity.scrolling.neoscroll-nvim" }, -- 平滑滚动 https://github.com/karb94/neoscroll.nvim
  { import = "astrocommunity.utility.noice-nvim" }, -- noice.nvim https://github.com/folke/noice.nvim
  { import = "astrocommunity.utility.nvim-toggler" }, -- 在 nvim 中反转文本 https://github.com/nguyenvukhang/nvim-toggler
  { import = "astrocommunity.indent.mini-indentscope" }, -- 缩进范围内可视化和操作 https://github.com/echasnovski/mini.indentscope
  { import = "astrocommunity.editing-support.wildfire-nvim" }, -- 文本范围更精细的选择 https://github.com/SUSTech-data/wildfire.nvim
  -- { import = "astrocommunity.lsp.nvim-lint" }, -- LSP 代码规范检查 https://github.com/mfussenegger/nvim-lint
  { import = "astrocommunity.lsp.actions-preview-nvim" }, -- LSP 代码操作的完全可定制预览器 https://github.com/aznhe21/actions-preview.nvim
  { import = "astrocommunity.lsp.lspsaga-nvim" }, -- LSP 代码操作的完全可定制预览器 https://github.com/nvimdev/lspsaga.nvim
  { import = "astrocommunity.media.codesnap-nvim" }, -- 📸 功能丰富的快照插件，可以为 Neovim 制作漂亮的代码快照 https://github.com/mistricky/codesnap.nvim
  { import = "astrocommunity.editing-support.bigfile-nvim" }, -- Make editing big files faster 🚀 https://github.com/LunarVim/bigfile.nvim
  { import = "astrocommunity.editing-support.neogen" }, -- 生成注释 https://github.com/danymat/neogen
  { import = "astrocommunity.editing-support.conform-nvim" }, -- 代码格式化 https://github.com/stevearc/conform.nvim
  { import = "astrocommunity.motion.mini-surround" }, -- 快捷更改环绕符号 https;//github.com/echasnovski/mini.surround
  { import = "astrocommunity.register.nvim-neoclip-lua" }, -- neovim 的剪贴板管理器 https://github.com/AckslD/nvim-neoclip.lua
  { import = "astrocommunity.search.nvim-spectre" }, -- 文本内容替换 https://github.com/nvim-pack/nvim-spectre
  { import = "astrocommunity.project.project-nvim" }, -- Neovim 的卓越项目管理解决方案 https://github.com/ahmedkhalf/project.nvim

  -- ai-pulgin
  { import = "astrocommunity.completion.avante-nvim" }, -- sursor https://github.com/yetone/avante.nvim

  --fy a/override with your plugins folder
}
