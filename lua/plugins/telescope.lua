return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",

		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},

		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	event = "VimEnter",
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
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")

		local map = require("utils").map

		local builtin = require("telescope.builtin")

		map("n", "<leader>sf", builtin.find_files)
		map("n", "<leader>sh", builtin.help_tags)
		map("n", "<leader>sk", builtin.keymaps)
		map("n", "<leader>ss", builtin.spell_suggest)

		map("n", "<leader>df", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({ previewer = false }))
		end)
		map("n", "<leader>wf", function()
			builtin.live_grep(require("telescope.themes").get_dropdown({ previewer = false }))
		end)

		map("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end)

		map("n", "<leader>sp", function()
			builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
		end)
	end,
}
