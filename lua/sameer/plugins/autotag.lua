return {
    "windwp/nvim-ts-autotag",
    ft = { "html", "markdown", "typescriptreact", "javascriptreact", "astro" },
    config = function()
        require('nvim-ts-autotag').setup({})
    end
}
