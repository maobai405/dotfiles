return function()
  return {
    chat = {
      loading_text = "Loading ...",
      question_sign = "🐼", -- 🙂
      answer_sign = "🤖", -- 🤖
    },
    actions_paths = {
      vim.fn.expand "~/.config/nvim/lua/config/tools/chatgpt/actions.json",
    },
  }
end
