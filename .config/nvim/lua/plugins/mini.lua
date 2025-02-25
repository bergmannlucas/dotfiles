return {
    {
      "echasnovski/mini.nvim",
      config = function()
        require('mini.pairs').setup() -- enable auto pairs
        require('mini.sessions').setup() -- enable sessions
      end,
    },
  }