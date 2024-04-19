return {
	"stevearc/conform.nvim",
	lazy = false,
	opts = {
		formatters_by_ft = {
			go = { "goimports", "gofumpt" },
			lua = { "stylua" },
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			markdown = { { "prettierd", "prettier" } },
			json = { { "prettierd", "prettier" } },
		},
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
		},
	},
}
