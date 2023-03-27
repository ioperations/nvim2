return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local Bug = ""

      --     local ArrowCircleDown = ""
      --     local ArrowCircleLeft = ""
      local ArrowCircleRight = ""
      --     local ArrowCircleUp = ""
      --     local BoldArrowDown = ""
      --     local BoldArrowLeft = ""
      --     local BoldArrowRight = ""
      --     local BoldArrowUp = ""
      local breakpoint = {
        text = Bug,
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      }
      local stopped = {
        text = ArrowCircleRight,
        texthl = "DiagnosticSignWarn",
        linehl = "Visual",
        numhl = "DiagnosticSignWarn",
      }

      vim.fn.sign_define("DapBreakpoint", breakpoint)
      vim.fn.sign_define("DapBreakpointRejected", breakpoint)
      vim.fn.sign_define("DapStopped", stopped)
    end,
  },
  {
    {
      "rcarriga/nvim-dap-ui",

      config = function()
        local opt = {
          icons = { expanded = "", collapsed = "", circular = "" },
          mappings = {
            -- Use a table to apply multiple mappings
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t",
          },
          -- Use this to override mappings for specific elements
          element_mappings = {},
          expand_lines = true,
          layouts = {
            {
              elements = {
                { id = "scopes", size = 0.33 },
                { id = "breakpoints", size = 0.17 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 },
              },
              size = 0.33,
              position = "right",
            },
            {
              elements = {
                { id = "repl", size = 0.45 },
                { id = "console", size = 0.55 },
              },
              size = 0.27,
              position = "bottom",
            },
          },
          controls = {
            enabled = true,
            -- Display controls in this element
            element = "repl",
            icons = {
              pause = "",
              play = "",
              step_into = "",
              step_over = "",
              step_out = "",
              step_back = "",
              run_last = "",
              terminate = "",
            },
          },
          floating = {
            max_height = 0.9,
            max_width = 0.5, -- Floats will be treated as percentage of your screen.
            border = "single", -- Border style. Can be 'single', 'double' or 'rounded'
            mappings = {
              close = { "q", "<Esc>" },
            },
          },
          windows = { indent = 1 },
          render = {
            max_type_length = nil, -- Can be integer or nil.
            max_value_lines = 100, -- Can be integer or nil.
          },
        }

        local dapui = require("dapui")
        local status_ok, dap = pcall(require, "dap")
        if not status_ok then
          return
        end

        dapui.setup(opt)
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
      end,
      lazy = true,
    },
  },
}
