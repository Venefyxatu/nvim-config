return {
  "mfussenegger/nvim-dap",
  dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap-python" },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    local bin_locations = vim.fn.stdpath("data") .. "/mason/bin/"
    dap.adapters.codelldb = {
      type = "executable",
      command = bin_locations .. "codelldb",
      name = "codelldb",
    }

    require("dap-python").setup(
      (os.getenv("VIRTUAL_ENV") or "~/.local/share/nvim/mason/packages/debugpy/venv") .. "/bin/python3"
    )

    table.insert(dap.configurations.python, 1, {
      type = "python",
      request = "launch",
      name = "Launch with arguments (all code)",
      program = "${file}",
      pythonPath = function()
        return (os.getenv("VIRTUAL_ENV") or "~/.local/share/nvim/mason/packages/debugpy/venv") .. "/bin/python3"
      end,
      args = function()
        local args_string = vim.fn.input("Arguments: ")
        return vim.split(args_string, " +")
      end,
      justMyCode = false,
    })

    -- left here for reference - overseer with {tasks,launch}.json makes it unnecessary
    -- dap.configurations.cpp = {
    --   {
    --     name = "Launch basic",
    --     type = "codelldb",
    --     request = "launch",
    --     -- program = "main",
    --     program = function()
    --       vim.fn.system("make PROJECT_NAME=main OBJS='*cpp' BUILD_MODE=DEBUG")
    --       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    --     end,
    --     cwd = "${workspaceFolder}",
    --     stopOnEntry = false,
    --     runInTerminal = false,
    --   },
    -- }

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    --[[
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    --[[
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    --]]

    vim.keymap.set("n", "<Leader>dc", dap.continue, {})
    vim.keymap.set("n", "<Leader>dso", dap.step_over, {})
    vim.keymap.set("n", "<Leader>dsi", dap.step_into, {})
    vim.keymap.set("n", "<Leader>dsO", dap.step_out, {})
    vim.keymap.set("n", "<F10>", dap.step_over, {})
    vim.keymap.set("n", "<F11>", dap.step_into, {})
    vim.keymap.set("n", "<F12>", dap.step_out, {}) -- step <u>p
    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dl", dap.list_breakpoints, {})
    vim.keymap.set("n", "<Leader>dC", dap.clear_breakpoints, {})
    vim.keymap.set("n", "<Leader>dT", dap.terminate, {})
    vim.keymap.set("n", "<Leader>dL", dap.run_last, {})
    vim.keymap.set("n", "<Leader>dX", dapui.close, {})
  end,
}
