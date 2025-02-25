return {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require("telescope").setup({})

        vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, desc = "Find files" })
        vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true, desc = "Live grep" })
      end,
    },
  }