return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim"
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- formattings
          null_ls.builtins.formatting.stylua,
          -- null_ls.builtins.formatting.prettier,

          -- diagnostics
          -- null_ls.builtins.diagnostics.eslint_d
          -- require("none-ls.diagnostics.eslint_d").with({
          --   only_local = "node_modules/.bin"
          -- }),
        },
      })

      vim.keymap.set("n", "<leader>ll", vim.lsp.buf.format, {})
    end,
  },
}
