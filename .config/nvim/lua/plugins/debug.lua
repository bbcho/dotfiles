-- Debug Adapter Protocol (DAP) support for Python and R
--
-- SOURCES:
-- https://github.com/mfussenegger/nvim-dap
-- https://github.com/rcarriga/nvim-dap-ui
-- https://github.com/mfussenegger/nvim-dap-python

return {
  -- Core DAP client
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- UI for debugging
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio", -- required by dap-ui
      -- Virtual text for variable values
      "theHamsta/nvim-dap-virtual-text",
    },
    keys = {
      -- Breakpoints
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, desc = "Conditional breakpoint" },
      { "<leader>dl", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, desc = "Log point" },

      -- Execution
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to cursor" },
      { "<leader>dn", function() require("dap").step_over() end, desc = "Step over" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step into" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Step out" },

      -- Session
      { "<leader>dr", function() require("dap").restart() end, desc = "Restart" },
      { "<leader>dq", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dd", function() require("dap").disconnect() end, desc = "Disconnect" },

      -- UI
      { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = { "n", "v" } },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Hover widgets" },

      -- REPL
      { "<leader>dR", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Signs for breakpoints
      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◐", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })

      -- Highlight for current line when stopped
      vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#2e3440" })

      -- Setup DAP UI
      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "→" },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.4 },
              { id = "breakpoints", size = 0.2 },
              { id = "stacks", size = 0.2 },
              { id = "watches", size = 0.2 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 10,
            position = "bottom",
          },
        },
      })

      -- Setup virtual text
      require("nvim-dap-virtual-text").setup({
        commented = true, -- prefix with comment string
      })

      -- Auto open/close UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- R debugging via vscDebugger
      -- Requires: install.packages("vscDebugger", repos = "https://manuelhentschel.r-universe.dev")
      dap.adapters.r = {
        type = "server",
        port = "${port}",
        executable = {
          command = "R",
          args = { "--slave", "-e", "vscDebugger::.vsc.listen(${port})" },
        },
      }

      dap.configurations.r = {
        {
          type = "r",
          request = "launch",
          name = "Launch R file",
          program = "${file}",
          debugMode = "file",
        },
        {
          type = "r",
          request = "launch",
          name = "Launch R function",
          program = "${file}",
          debugMode = "function",
          allowGlobalDebugging = true,
        },
        {
          type = "r",
          request = "attach",
          name = "Attach to R process",
          debugMode = "attached",
          allowGlobalDebugging = true,
        },
      }
    end,
  },

  -- Python debugging
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      -- Use debugpy from Mason or system Python
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      -- Use vim.uv.fs_stat which handles symlinks correctly
      if vim.uv.fs_stat(mason_path) then
        require("dap-python").setup(mason_path)
      else
        require("dap-python").setup("python") -- fallback to system python
      end

      -- Python-specific keymaps
      vim.keymap.set("n", "<leader>dpm", function()
        require("dap-python").test_method()
      end, { desc = "Debug test method" })

      vim.keymap.set("n", "<leader>dpc", function()
        require("dap-python").test_class()
      end, { desc = "Debug test class" })

      vim.keymap.set("v", "<leader>dps", function()
        require("dap-python").debug_selection()
      end, { desc = "Debug selection" })
    end,
  },

  -- Ensure debugpy is installed via Mason
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "debugpy" })
    end,
  },
}
