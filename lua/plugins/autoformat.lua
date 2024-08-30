return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
		},
	},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "gofumpt", "goimports" },
				lua = { "stylua" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				-- astro = { "prettier" },
				markdown = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				c = { "clang-format" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		})
	end,
}
