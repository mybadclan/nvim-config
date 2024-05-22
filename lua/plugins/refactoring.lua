return {
	{
		"smjonas/inc-rename.nvim",
		config = function()
      require("inc_rename").setup()
			vim.keymap.set("n", "<leader>rn", function()
				return ":IncRename " .. vim.fn.expand("<cword>")
			end, { expr = true })
		end,
	},
	-- Refactoring tool
	{
		"ThePrimeagen/refactoring.nvim",
		opts = {},
		config = function()
			vim.keymap.set("v", "<leader>r", function()
				require("refactoring").select_refactor({
					show_success_message = true,
				})
			end, {})
		end,
	},
}
