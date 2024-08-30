return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-tree/nvim-web-devicons", lazy = true },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local vimgrep_arguments = { unpack(require("telescope.config").values.vimgrep_arguments) }

		table.insert(vimgrep_arguments, "--hidden")
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")

		require("telescope").setup({
			defaults = {
				vimgrep_arguments = vimgrep_arguments,
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")

		local map = function(keys, func)
			vim.keymap.set("n", keys, func)
		end

		local builtin = require("telescope.builtin")

		map("<leader>sf", builtin.find_files)
		map("<leader>sh", builtin.help_tags)
		map("<leader>sk", builtin.keymaps)
		map("<leader>sd", builtin.diagnostics)
		map("<leader>ss", builtin.spell_suggest)

		map("<leader>df", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({ previewer = false }))
		end)
		map("<leader>wf", function()
			builtin.live_grep(require("telescope.themes").get_dropdown({ previewer = false }))
		end)

		map("<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end)
	end,
}
