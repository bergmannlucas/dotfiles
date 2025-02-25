return {
    {
      "nvim-neo-tree/neo-tree.nvim",
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
            filtered_items = {
              hide_dotfiles = false,
              hide_gitignored = false,
              hide_hidden = false,
            },
          },
        })

        vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")
      end,
    },
  }