return {
	{
		"kdheepak/lazygit.nvim",
		opts = {
			cmd = {
				"LazyGit",
				"LazyGitConfig",
				"LazyGitCurrentFile",
				"LazyGitFilter",
				"LazyGitFilterCurrentFile",
			},
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		config = function()
			vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup()

			vim.keymap.set("n", "]g", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]g", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end)

			vim.keymap.set("n", "[g", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end)

			vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk)
			vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk)
			vim.keymap.set("v", "<leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end)
			vim.keymap.set("v", "<leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end)
			vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer)
			vim.keymap.set("n", "<leader>gu", gitsigns.undo_stage_hunk)
			vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer)

			vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk)
			vim.keymap.set("n", "<leader>gb", function()
				gitsigns.blame_line({ full = true })
			end)
			vim.keymap.set("n", "<leader>tgb", gitsigns.toggle_current_line_blame)
			vim.keymap.set("n", "<leader>gdi", gitsigns.diffthis)
			vim.keymap.set("n", "<leader>gD", function() end)
			vim.keymap.set("n", "<leader>tgd", gitsigns.toggle_deleted)
		end,
	},
}
