local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<F5>"] = {
      function()
        require('dap').continue()
      end,
      "Continue Debugging"
    },
    ["<F10>"] = {
      function()
        require('dap').step_over()
      end,
      "Step Over"
    },
    ["<F11>"] = {
      function()
        require('dap').step_into()
      end,
      "Step Into"
    },
    ["<F12>"] = {
      function()
        require('dap').step_out()
      end,
      "Step Out"
    },
    ["<leader>db"] = {
      function()
        require('dap').toggle_breakpoint()
      end,
      "Toggle Breakpoint"
    },
    ["<leader>dB"] = {
      function()
        require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end,
      "Set Conditional Breakpoint"
    },
    ["<leader>lp"] = {
      function()
        require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
      end,
      "Set Log Point"
    },
    ["<leader>dr"] = {
      function()
        require('dap').repl.open()
      end,
      "Open REPL"
    },
    ["<leader>dl"] = {
      function()
        require('dap').run_last()
      end,
      "Run Last Debugging Session"
    },
    ["<leader>dui"] = {
      function()
        require('dapui').toggle()
      end,
      "Toggle DAP UI"
    }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end,
      "Debug Python Test Method"
    }
  }
}

return M

