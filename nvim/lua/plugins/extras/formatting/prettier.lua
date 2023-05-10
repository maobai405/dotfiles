return {
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "prettier")
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")
            opts.sources = {
                nls.builtins.formatting.prettier.with({
                    filetypes = {
                        "vue",
                        "typescript",
                        "javascript",
                        "typescriptreact",
                        "javascriptreact",
                        "yaml",
                        "html",
                        "css",
                        "scss",
                        "sh",
                        "markdown",
                    },
                    extra_args = { "--tab-width", "4", "--max-line-length", "5000", "--prose-wrap" },
                }),
            }
            table.insert(opts.sources, nls.builtins.formatting.prettier)
        end,
    },
}
