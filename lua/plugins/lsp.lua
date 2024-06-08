return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			local capabilities = nil
			if pcall(require, "cmp_nvim_lsp") then
				capabilities = require("cmp_nvim_lsp").default_capabilities()
			end

			local lspconfig = require("lspconfig")

			local servers = {
				lua_ls = true,
				tsserver = true,
				bashls = true,
				marksman = true,
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

			local servers_to_install = vim.tbl_filter(function(key)
				local t = servers[key]
				if type(t) == "table" then
					return not t.manual_install
				else
					return t
				end
			end, vim.tbl_keys(servers))

			require("mason").setup()

			local ensure_installed = {
				"stylua",
				"gofumpt",
				"goimports",
				"prettier",
			}

			vim.list_extend(ensure_installed, servers_to_install)
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			for name, config in pairs(servers) do
				if config == true then
					config = {}
				end
				config = vim.tbl_deep_extend("force", {}, {
					capabilities = capabilities,
				}, config)

				lspconfig[name].setup(config)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local map = function(keys, func)
						vim.keymap.set("n", keys, func, { buffer = event.buf })
					end

					vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

					local builtin = require("telescope.builtin")

					map("gd", builtin.lsp_definitions)
					map("gr", builtin.lsp_references)
					map("<leader>ds", builtin.lsp_document_symbols)

					map("K", vim.lsp.buf.hover)
					map("<leader>rn", vim.lsp.buf.rename)
					map("<space>ca", vim.lsp.buf.code_action)

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end

					vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
						pattern = "*",
						callback = function()
							vim.lsp.codelens.refresh({ bufnr = event.buf })
						end,
					})
				end,
			})
		end,
	},
}
