return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.keymap.set("n", "<leader>th", function()
        require("trouble").toggle()
      end)
      vim.keymap.set("n", "<leader>trw", function()
        require("trouble").toggle("workspace_diagnostics")
      end)
      vim.keymap.set("n", "<leader>trd", function()
        require("trouble").toggle("document_diagnostics")
      end)
      vim.keymap.set("n", "<leader>trq", function()
        require("trouble").toggle("quickfix")
      end)
      vim.keymap.set("n", "<leader>trl", function()
        require("trouble").toggle("loclist")
      end)
      vim.keymap.set("n", "<leader>trR", function()
        require("trouble").toggle("lsp_references")
      end)

      local actions = require("telescope.actions")
      local trouble = require("trouble.providers.telescope")

      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
          },
        },
      })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
      presets = { inc_rename = true },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          use_libuv_file_watcher = true,
          -- hijack_netrw_behavior = "disabled",
          components = {
            name = function(config, node, state)
              local components = require("neo-tree.sources.common.components")

              local name = components.name(config, node, state)
              if node:get_depth() == 1 then
                name.text = vim.fs.basename(vim.loop.cwd() or "")
              end
              return name
            end,
          },
        },
        window = {
          position = "right",
        },
        buffers = {
          follow_current_file = {
            enabled = true,
          },
        },
      })

      vim.keymap.set("n", "<leader>b", ":Neotree filesystem reveal right<CR>", {})
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")

      -- keybindings
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
      vim.keymap.set("n", "<leader>flg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      -- vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 800,
      background_colour = "#000000",
      animation = "fade_in_slide_out",
      render = "wrapped-compact",
      top_down = false,
    },
  },
}
