return {
  icons = {
    group = vim.g.icons_enabled ~= false and "" or "+",
    rules = false,
    separator = "-",
  },
  disable = { filetypes = { "TelescopePrompt" } },
}
