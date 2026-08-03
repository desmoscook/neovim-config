return {
  "desmoscook/codex.nvim",
  lazy = true,
  cmd = { "Codex", "CodexToggle", "CodexSidebar", "CodexFloat" }, -- Optional: Load only on command execution
  keys = {
    {
      "<leader>ps",
      function()
        require("codex").toggle({ panel = true, width = 0.2, height = 1.0 })
      end,
      desc = "Toggle Codex side-panel",
      mode = { "n", "t" },
    },
    {
      "<leader>pp",
      function()
        require("codex").toggle({ panel = false, width = 0.8, height = 0.8 })
      end,
      desc = "Toggle Codex floating popup",
      mode = { "n", "t" },
    },
  },
  opts = {
    keymaps = {
      toggle = nil, -- Keybind to toggle Codex window (Disabled by default, watch out for conflicts)
      sidebar = nil, -- Keybind to open Codex side-panel
      float = nil, -- Keybind to open Codex floating popup
      quit = "<C-q>", -- Keybind to close the Codex window (default: Ctrl + q)
    }, -- Disable internal default keymap (<leader>cc -> :CodexToggle)
    border = "rounded", -- Options: 'single', 'double', or 'rounded'
    width = 0.2, -- Width of the floating window (0.0 to 1.0)
    height = 1.0, -- Height of the floating window (0.0 to 1.0)
    model = nil, -- Optional: pass a string to use a specific model (e.g., 'o3-mini')
    autoinstall = true, -- Automatically install the Codex CLI if not found
    panel = true, -- Open Codex in a side-panel (vertical split) instead of floating window
    use_buffer = false, -- Capture Codex stdout into a normal buffer instead of a terminal buffer
  },
}
