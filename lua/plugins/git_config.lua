return {
  {
    "sindrets/diffview.nvim",
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 100,
        ignore_whitespace = true,
        virt_text_priority = 100,
      },
    },
  },
}
