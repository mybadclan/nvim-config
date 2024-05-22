return {
  "datsfilipe/min-theme.nvim",
  opts = {
    theme = "dark",
    transparent = false,
    italics = {
      comments = true, -- Boolean: Italicizes comments
      keywords = true, -- Boolean: Italicizes keywords
      functions = true, -- Boolean: Italicizes functions
      strings = true, -- Boolean: Italicizes strings
      variables = true, -- Boolean: Italicizes variables
    },
    overrides = {},  -- A dictionary of group names, can be a function returning a dictionary or a table.
  },
  config = function()
    vim.cmd.colorscheme("min-theme")
  end,
}
