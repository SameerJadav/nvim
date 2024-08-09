return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			vim.o.completeopt = "menu,menuone,noselect,noinsert,preview"

			local cmp = require("cmp")
			local defaults = require("cmp.config.default")()

			cmp.setup({
				sorting = defaults.sorting,
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "buffer" },
				}),
				mapping = {
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-N>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-P>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-Y>"] = cmp.mapping(
						cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						}),
						{ "i", "c" }
					),
				},
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
			})

			vim.keymap.set({ "i", "s" }, "<C-L>", function()
				if vim.snippet.active({ direction = 1 }) then
					return "<Cmd>lua vim.snippet.jump(1)<CR>"
				end
			end, { expr = true })

			vim.keymap.set({ "i", "s" }, "<C-H>", function()
				if vim.snippet.active({ direction = -1 }) then
					return "<Cmd>lua vim.snippet.jump(-1)<CR>"
				end
			end, { expr = true })
		end,
	},
}
