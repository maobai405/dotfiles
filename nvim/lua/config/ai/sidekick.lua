local M = {}

M.keys = {
  {
    "<c-.>",
    function()
      require("sidekick.cli").toggle({ name = "claude", focus = true })
    end,
    desc = "Sidekick Toggle Claude",
  },
}

M.config = {
  nes = {
    enabled = false,
  },
  cli = {
    win = {
      -- layout = "float",
    },
  },
}

return M
