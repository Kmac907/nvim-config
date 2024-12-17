local plugins = {

  {
    "nvim-neotest/nvim-nio",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      local dap = require('dap')

      -- Configure your debugger adapters here
      dap.adapters.python = {
        type = 'executable';
        command = vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python';
        args = { '-m', 'debugpy.adapter' };
      }

      dap.configurations.python = {
        {
          type = 'python';
          request = 'launch';
          name = "Launch file";

          program = "${file}";
          pythonPath = function()
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
              return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
              return cwd .. '/.venv/bin/python'
            elseif vim.fn.executable(cwd .. '/env/bin/python') == 1 then
              return cwd .. '/env/bin/python'
            else
              return vim.fn.exepath('python3') or vim.fn.exepath('python') or '/usr/bin/python'
            end
          end;
        },
        {
          type = 'python';
          request = 'attach';
          name = "Attach to process";

          connect = {
            port = 5678;
            host = "127.0.0.1";
          };
          mode = "remote";
          pythonPath = function()
            return vim.fn.exepath('python3') or vim.fn.exepath('python') or '/usr/bin/python'
          end;
        },
      }

      -- Load DAP mappings
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function(_, opts)
      local path = vim.fn.stdpath('data') .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "pyright",
        "perlnavigator",
        "marksman"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}
return plugins

