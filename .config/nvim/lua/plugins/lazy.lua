return {
	{
	  "folke/lazy.nvim",
	  version = "*",
	  config = function()
		require("lazy").setup({
		  { import = "plugins" },
		})
	  end,
	},
  }