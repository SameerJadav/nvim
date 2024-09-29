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
			cmd = "LazyDev",
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
			ts_ls = {},
			gopls = {
				settings = {
					gopls = {
						gofumpt = true,
						staticcheck = true,
						verboseOutput = true,
						semanticTokens = true,
						vulncheck = "Imports",
						analyses = {
							shadow = true,
							unusedvariable = true,
							useany = true,
						},
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

		local tools = { "stylua", "gofumpt", "goimports", "staticcheck", "prettier", "clang-format" }

		require("mason-tool-installer").setup({ ensure_installed = tools })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
			callback = function(event)
				local map = require("utils").map
				local builtin = require("telescope.builtin")

				map("n", "gd", builtin.lsp_definitions, { buffer = event.buf })
				map("n", "gr", builtin.lsp_references, { buffer = event.buf })
				map("n", "<leader>ds", builtin.lsp_document_symbols, { buffer = event.buf })
				map("n", "<C-K>", vim.lsp.buf.signature_help, { buffer = event.buf })

				map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = event.buf })
				map("n", "<space>ca", vim.lsp.buf.code_action, { buffer = event.buf })

				map("n", "<leader>lr", "<Cmd>LspRestart<CR>", { buffer = event.buf })
				map("n", "<leader>li", "<Cmd>LspInstall<CR>", { buffer = event.buf })
				map("n", "<leader>lI", "<Cmd>LspInfo<CR>", { buffer = event.buf })
				map("n", "<leader>ls", "<Cmd>LspStart<CR>", { buffer = event.buf })
				map("n", "<leader>lS", "<Cmd>LspStop<CR>", { buffer = event.buf })
			end,
		})
	end,
}
