return {
    {
      "folke/which-key.nvim",
      config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.add({
          { "<leader>f", group = "Telescope" },
          { "<leader>o", group = "Obsidian" },
        })
      end,
    },
  }