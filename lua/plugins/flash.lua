return {
  "folke/flash.nvim",

  -- 使用 s 跳转到单词
  -- 使用 R 选中一个段落
  keys = {
    -- disable the default flash keymap
    -- { "s", mode = { "n", "x", "o" }, false },
    { "S", mode = { "n", "x", "o" }, false },
    -- {
    --   "r",
    --   mode = { "n", "x", "o" },
    --   function()
    --     require("flash").jump()
    --   end,
    --   desc = "Flash",
    -- },
    {
      "R",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
  },
}
