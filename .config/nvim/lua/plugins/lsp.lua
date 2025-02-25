return {
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
          "williamboman/mason.nvim",
          "neovim/nvim-lspconfig",
        },
        config = function()
          require("mason-lspconfig").setup({
            ensure_installed = { 
                "ts_ls", 
                "gopls", 
                "marksman", 
                "tailwindcss",
                "lua_ls",
                "bashls"
            },
            automatic_installation = true,
          })
          local lspconfig = require("lspconfig")

          local function on_attach(_, bufnr)
            local nmap = function(keys, func, desc)
              if desc then
                desc = 'LSP: ' .. desc
              end
          
              vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            local opts = { buffer = bufnr, noremap = true, silent = true }
            
            nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
            nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            nmap('<leader>d', vim.diagnostic.open_float, "[D]iagnostics")
            nmap(']d', vim.diagnostic.goto_next, "Next diagnostic")
            nmap('[d', vim.diagnostic.goto_prev, "Previous diagnostic")
            nmap("<leader>q", vim.diagnostic.setloclist, "Diagnostic [Q]uickfix list")
          end

          require("mason-lspconfig").setup_handlers({
            function(server_name)
              lspconfig[server_name].setup({
                on_attach = on_attach,
              })
            end,
          })
        end,
      },
  }