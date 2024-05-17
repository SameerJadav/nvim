return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {},
    config = function()
        require("nvim-treesitter.install").prefer_git = true
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "go",
                "gomod",
                "gosum",
                "javascript",
                "typescript",
                "bash",
                "lua",
                "luadoc",
                "vim",
                "vimdoc",
            },
            autotag = {
                enable = true,
                enable_rename = true,
                enable_close = true,
                enable_close_on_slash = true,
                filetypes = { "html", "markdown", "typescriptreact", "javascriptreact", "astro" },
            },
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
