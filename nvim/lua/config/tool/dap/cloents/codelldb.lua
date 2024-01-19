-- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb)
return function()
  local dap = require("dap")
  local utils = require("utils.dap")

  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      command = vim.fn.exepath("codelldb"), -- Find codelldb on $PATH
      args = { "--port", "${port}" },
      detached = false,
    },
  }
  dap.configurations.c = {
    {
      name = "Debug",
      type = "codelldb",
      request = "launch",
      program = utils.input_exec_path(),
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      terminal = "integrated",
    },
    {
      name = "Debug (with args)",
      type = "codelldb",
      request = "launch",
      program = utils.input_exec_path(),
      args = utils.input_args(),
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      terminal = "integrated",
    },
    {
      name = "Attach to a running process",
      type = "codelldb",
      request = "attach",
      program = utils.input_exec_path(),
      stopOnEntry = false,
      waitFor = true,
    },
  }
  dap.configurations.rust = dap.configurations.c
end
