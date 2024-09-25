return {
  { "AstroNvim/astrolsp", optional = true, opts = { formatting = { disabled = true } } },
  { "jay-babu/mason-null-ls.nvim", optional = true, opts = { methods = { formatting = false } } },
  {
    "stevearc/conform.nvim",
    event = "User AstroFile",
    cmd = "ConformInfo",
    dependencies = {
      { "williamboman/mason.nvim", optional = true },
      {
        "AstroNvim/astrocore",
        opts = {
          options = { opt = { formatexpr = "v:lua.require'conform'.formatexpr()" } },
          commands = {
            Format = {
              function(args)
                local range = nil
                if args.count ~= -1 then
                  local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                  range = {
                    start = { args.line1, 0 },
                    ["end"] = { args.line2, end_line:len() },
                  }
                end
                require("conform").format { async = true, lsp_fallback = true, range = range }
              end,
              desc = "Format buffer",
              range = true,
            },
          },
          mappings = {
            n = {
              ["<Leader>uf"] = {
                function()
                  if vim.b.autoformat == nil then
                    if vim.g.autoformat == nil then vim.g.autoformat = true end
                    vim.b.autoformat = vim.g.autoformat
                  end
                  vim.b.autoformat = not vim.b.autoformat
                  require("astrocore").notify(
                    string.format("Buffer autoformatting %s", vim.b.autoformat and "on" or "off")
                  )
                end,
                desc = "Toggle autoformatting (buffer)",
              },
              ["<Leader>uF"] = {
                function()
                  if vim.g.autoformat == nil then vim.g.autoformat = true end
                  vim.g.autoformat = not vim.g.autoformat
                  vim.b.autoformat = nil
                  require("astrocore").notify(
                    string.format("Global autoformatting %s", vim.g.autoformat and "on" or "off")
                  )
                end,
                desc = "Toggle autoformatting (global)",
              },
            },
          },
        },
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        vue = { "prettier" },
        json = { "biome" },
        javascript = { "biome", lsp_format = "fallback" },
        typescript = { "biome", lsp_format = "fallback" },
        javascriptreact = { "biome", lsp_format = "fallback" },
        typescriptreact = { "biome", lsp_format = "fallback" },
        -- rust = { "rustfmt" },
        -- dart = { "dart_format" },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
        prettier = {
          prepend_args = { "--config=" .. vim.fn.expand "~/.config/nvim/prettierrc.json" },
        },
        biome = {
          prepend_args = { "format", "--config-path=" .. vim.fn.expand "~/.config/nvim" },
        },
      },
      format_on_save = function(bufnr)
        if vim.g.autoformat == nil then vim.g.autoformat = true end
        local autoformat = vim.b[bufnr].autoformat
        if autoformat == nil then autoformat = vim.g.autoformat end
        if autoformat then return { timeout_ms = 500, lsp_fallback = true } end
      end,
    },
  },
}