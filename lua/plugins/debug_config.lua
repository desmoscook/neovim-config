-- blog : https://miguelcrespo.co/posts/how-to-debug-like-a-pro-using-neovim/
-- video: https://www.youtube.com/watch?v=oYzZxi3SSnM

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    -- "Pocco81/DAPInstall.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Open dapui automatically when a new debug session is created
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()

    vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
    vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

    end
  end,
}
