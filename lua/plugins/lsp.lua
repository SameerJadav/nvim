return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		{ "j-hui/fidget.nvim", opts = {} },

		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local servers = {
			lua_ls = {},
			tsserver = {},
			gopls = {
				settings = {
					gopls = {
						usePlaceholders = true,
						staticcheck = true,
						gofumpt = true,
						semanticTokens = true,
						vulncheck = "Imports",
					},
					analyses = {
						shadow = true,
						unusedvariable = true,
					},
					codelenses = {
						run_govulncheck = true,
					},
				},
			},
		}

		local tools = { "stylua", "gofumpt", "goimports", "prettier" }

		local ensure_installed = vim.list_extend(tools, vim.tbl_keys(servers))

		require("mason").setup()
		require("mason-lspconfig").setup()
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		local lspconfig = require("lspconfig")

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		if pcall(require, "cmp_nvim_lsp") then
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		end

		for name, config in pairs(servers) do
			config = vim.tbl_deep_extend("force", { capabilities = capabilities }, config)
			lspconfig[name].setup(config)
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func)
					vim.keymap.set("n", keys, func, { buffer = event.buf })
				end

				local builtin = require("telescope.builtin")

				map("gd", builtin.lsp_definitions)
				map("gr", builtin.lsp_references)
				map("<leader>ds", builtin.lsp_document_symbols)

				map("K", vim.lsp.buf.hover)
				map("<leader>rn", vim.lsp.buf.rename)
				map("<space>ca", vim.lsp.buf.code_action)

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_augroup = vim.api.nvim_create_augroup("custom-lsp-highlight", { clear = false })

					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("custom-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "custom-lsp-highlight", buffer = event2.buf })
						end,
					})
				end
			end,
		})
	end,
}
