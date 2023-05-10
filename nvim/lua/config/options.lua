-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- 自动将 .es6 文件识别为 JavaScript 文件类型
vim.api.nvim_exec(
    [[
		augroup filetypedetect
			au BufNewFile,BufRead *.es6 setfiletype javascript
		augroup END
	]],
    false
)

local opt = vim.opt
-- 自增序号
opt.relativenumber = false
-- Tab缩进空格数
opt.shiftwidth = 4
opt.tabstop = 4
opt.cursorline = false -- 禁止光标行高亮
