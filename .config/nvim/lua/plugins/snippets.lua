return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local ls = require("luasnip")
      
      ls.config.set_config({
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
      })

      require("luasnip.loaders.from_vscode").lazy_load()
      
      require("luasnip.loaders.from_lua").load({paths = vim.fn.stdpath("config") .. "/lua/snippets/"})

      vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true, desc = "Expand snippet"})
      vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump(1) end, {silent = true, desc = "Jump to next snippet node"})
      vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true, desc = "Jump to previous snippet node"})

      vim.keymap.set({"i", "s"}, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, {silent = true, desc = "Change snippet choice"})
      
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = vim.fn.stdpath("config") .. "/lua/snippets/*.lua",
        callback = function()
          require("luasnip.loaders.from_lua").load({paths = vim.fn.stdpath("config") .. "/lua/snippets/"})
        end,
      })
    end,
  },
} 