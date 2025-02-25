return {
    {
      "mfussenegger/nvim-dap",
      config = function()
        require("dap").adapters.go = {
          type = "executable",
          command = "go-debug-adapter",
        }
        require("dap").configurations.go = {
          {
            type = "go",
            name = "Debug",
            request = "launch",
            program = "${file}",
          },
        }
      end,
    },
  }