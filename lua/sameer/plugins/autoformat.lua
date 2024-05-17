return {
    "stevearc/conform.nvim",
    lazy = false,
    keys = {
        {
            "==",
            function()
                require('conform').format { async = true, lsp_fallback = true }
            end,
            mode = "",
        },
    },
    opts = {
        formatters_by_ft = {
            go = { "goimports", "gofumpt" },
            lua = { "stylua" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            markdown = { "prettier" },
            json = { "prettier" },
        },
        format_on_save = {
            lsp_fallback = true,
            timeout_ms = 500,
        },
    },
    config = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(args)
                require("conform").format({
                    bufnr = args.buf,
                    lsp_fallback = true,
                    quiet = true,
                })
            end,
        })
    end,
}
