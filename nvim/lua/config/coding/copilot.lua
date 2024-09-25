return function()
  return {
    cmp = {
      enabled = true,
      method = "getCompletionsCycling",
    },
    panel = {
      -- if true, it can interfere with completions in copilot-cmp
      enabled = false,
    },
    suggestion = {
      -- if true, it can interfere with completions in copilot-cmp
      enabled = true,
      auto_trigger = true,
    },
    filetypes = {
      ["dap-repl"] = false,
      ["big_file_disabled_ft"] = false,
    },
  }
end
