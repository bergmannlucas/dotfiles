return {
  "nvim-telescope/telescope.nvim",
  -- replace all Telescope keymaps with only one mapping
  keys = function()
    return {
      { "<leader>fd", "<cmd>Telescope find_files cwd=~/dev<cr>", desc = "Find Files (dev)" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files (cwd)" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Grep (cwd)" },
      { "<leader>fF", "<cmd>Telescope find_files cwd=/<cr>", desc = "Find Files (root)" },
      { "<leader>fG", "<cmd>Telescope live_grep cwd=/<cr>", desc = "Find Grep (root)" },
    }
  end,
}
