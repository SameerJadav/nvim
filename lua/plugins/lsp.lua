return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"b0o/schemastore.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = { library = { { path = "luvit-meta/library", words = { "vim%.uv" } } } },
		},
	},
	config = function()
		local servers = {
			lua_ls = {},
			tsserver = {},
			gopls = {
				settings = {
					gopls = {
						-- usePlaceholders = true,
						staticcheck = true,
						gofumpt = true,
						semanticTokens = true,
						vulncheck = "Imports",
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
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
			jsonls = {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			},
			yamlls = {
				settings = {
					yaml = {
						schemaStore = {
							enable = false,
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			},
		}

		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		if pcall(require, "cmp_nvim_lsp") then
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		end

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				local opts = vim.tbl_deep_extend("force", { capabilities = capabilities }, servers[server_name] or {})
				require("lspconfig")[server_name].setup(opts)
			end,
		})

		local tools = { "stylua", "gofumpt", "goimports", "prettier", "clang-format" }

		require("mason-tool-installer").setup({ ensure_installed = tools })

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

				map("<leader>rn", vim.lsp.buf.rename)
				map("<space>ca", vim.lsp.buf.code_action)

				map("<leader>lr", "<Cmd>LspRestart<CR>")
				map("<leader>li", "<Cmd>LspInstall<CR>")
				map("<leader>lI", "<Cmd>LspInfo<CR>")
				map("<leader>ls", "<Cmd>LspStart<CR>")
				map("<leader>lS", "<Cmd>LspStop<CR>")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end)
				end
			end,
		})
	end,
}
