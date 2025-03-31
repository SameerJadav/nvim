return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	config = function()
		local prettier_supported_ft = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"markdown",
			"html",
			"astro",
		}

		local formatters_by_filetype = {
			go = { "gofumpt", "goimports" },
			lua = { "stylua" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
		}

		for _, filetype in ipairs(prettier_supported_ft) do
			formatters_by_filetype[filetype] = { "prettierd", "prettier", stop_after_first = true }
		end

		require("conform").setup({
			formatters_by_ft = formatters_by_filetype,
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 1000,
			},
		})
	end,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
		},
	},
}
