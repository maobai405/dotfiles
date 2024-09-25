-- 这将在设置过程中最后运行，是配置的好地方
-- 诸如自定义文件类型之类的东西-这只是纯lua，所以任何不这样做的东西
-- 适合上面的正常配置位置可以到这里

-- 打开 Neovim 时加载特定于目录的会话，退出时保存它。
local resession = require "resession"
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     -- Only load the session if nvim was started with no args
--     if vim.fn.argc(-1) == 0 then
--       -- Save these to a different directory, so our manual sessions don't get polluted
--       resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
--     end
--   end,
--   nested = true,
-- })

-- 退出nvim时保存会话
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function() resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = true }) end,
})
