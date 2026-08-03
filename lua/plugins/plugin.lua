return {
  -- {
  --   -- function sticky scroll
  --   "nvim-treesitter/nvim-treesitter-context",
  --   requires = "nvim-treesitter/nvim-treesitter",
  -- },
  {
    -- cursor move smooth
    "sphamba/smear-cursor.nvim",
    opts = {},
  },
  -- {
  --   "amitds1997/remote-nvim.nvim",
  --   tag = "v0.0.1",
  --   config = remote_nvim,
  --   event = "VeryLazy",
  --   -- dev = true,
  -- },
  {
    "atiladefreitas/dooing",
    config = function()
      require("dooing").setup({
        -- your custom config here (optional)
      })
    end,
  },
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = "org",
    config = function()
      require("orgmode").setup({
        org_agenda_files = "~/Documents/orgfiles/**/*",
        org_default_notes_file = "~/Documents/orgfiles/refile.org",
        org_startup_indented = true,
        org_hide_leading_stars = true,
        org_hide_emphasis_markers = true,
        org_startup_folded = "content",
        org_ellipsis = " ...",
        org_log_into_drawer = "LOGBOOK",
        org_todo_keywords = { "TODO(t)", "DOING(d)", "|", "DONE(x)" },
        org_todo_keyword_faces = {
          DOING = ":foreground #FF8C00 :weight bold",
          DONE = ":foreground #50FA7B :weight bold",
        },
        org_agenda_custom_commands = {
          d = {
            description = "All DONE tasks",
            types = {
              {
                type = "tags",
                match = "/DONE",
                org_agenda_overriding_header = "已完成的任务",
              },
            },
          },
          t = {
            description = "TODO and DOING tasks",
            types = {
              {
                type = "tags",
                match = "/DOING",
                org_agenda_overriding_header = "进行中的任务",
              },
              {
                type = "tags",
                match = "/TODO",
                org_agenda_overriding_header = "待办任务",
              },
            },
          },
        },
        org_capture_templates = {
          t = { description = "Task", template = "* TODO %?\n  %u" },
          n = {
            description = "备忘录",
            template = "* %?\n  %u",
            target = "~/Documents/orgfiles/notes.org",
          },
        },
      })
      -- Experimental LSP support
      vim.lsp.enable("org")

      -- 快速打开 org 笔记
      vim.keymap.set("n", "<leader>on", function()
        Snacks.picker.files({ cwd = "~/Documents/orgfiles" })
      end, { desc = "Open org note" })
    end,
  },
}
