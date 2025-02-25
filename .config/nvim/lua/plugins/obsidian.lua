return {
  {
    'MeanderingProgrammer/markdown.nvim',
    main = "render-markdown",
    opts = {},
    name = 'render-markdown', 
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, 
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",  
    -- lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/dev/bergzettel",
        },
        {
          name = "work",
          path = "~/dev/workzettel",
        },
      },
      picker = {
        name = "telescope.nvim",
      },
      templates = {
        folder = "Other/Templates",
      },
    },
    config = function(_, opts)
      require("obsidian").setup(opts)

      vim.keymap.set('n', '<leader>ot', ':ObsidianTemplate<CR>', { desc = 'Apply Obsidian template' })
      vim.keymap.set('n', '<leader>on', ':ObsidianNew<CR>', { desc = 'Create new Obsidian note' })
      vim.keymap.set('n', '<leader>os', ':ObsidianSearch<CR>', { desc = 'Search Obsidian notes' })
    end,
  }
}
