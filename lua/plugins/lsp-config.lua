return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("package-lock.json", "yarn.lock", "bun.lockb"),
        single_file_support = false
			})
			lspconfig.tailwindcss.setup({})
      lspconfig.eslint.setup({
        capabilities = capabilities,
        autoFixOnSave = true
      })
      lspconfig.biome.setup({
        capabilities = capabilities
      })
      lspconfig.elixirls.setup({
        cmd = { "elixir-ls" },
        capabilities = capabilities,
      })
      lspconfig.denols.setup({
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
      })

      local telescope = require("telescope.builtin")

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>ld", telescope.lsp_definitions, {})
      vim.keymap.set("n", "<leader>lt", telescope.lsp_type_definitions, {})
      vim.keymap.set("n", "<leader>lr", telescope.lsp_references, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
	{
		"folke/lsp-colors.nvim",
		opts = {
			Error = "#db4b4b",
			Warning = "#e0af68",
			Information = "#0db9d7",
			Hint = "#10B981",
		},
	},
}
