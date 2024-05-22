return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		-- Tree sitter config
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			-- ensure_installed = { "lua", "javascript", "typescript", "html", "json", "css", "tsx" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
