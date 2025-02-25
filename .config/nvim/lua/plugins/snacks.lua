return {
    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      config = function()
        require("snacks").setup({
          bigfile = { enabled = true },
          dashboard = { enabled = true },
          explorer = { enabled = true },
          input = { enabled = true },
          notifier = { enabled = true },
          quickfile = { enabled = true },
          scope = { enabled = true },
          statuscolumn = { enabled = true },
          words = { enabled = true },
          lazygit = { enabled = true },
          git = { enabled = true },
        })

        vim.keymap.set("n", "<leader>lg", function() require("snacks").lazygit() end, { noremap = true, silent = true, desc = "Toggle LazyGit" })
      end,
    },
  }