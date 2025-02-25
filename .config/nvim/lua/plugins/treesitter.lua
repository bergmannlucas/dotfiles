return {
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = { 
            "lua", 
            "javascript", 
            "typescript", 
            "tsx",
            "go", 
            "markdown" 
          },
          highlight = { enable = true },
          indent = { enable = true },
          fold = { enable = true },
        })
      end,
    },
  }