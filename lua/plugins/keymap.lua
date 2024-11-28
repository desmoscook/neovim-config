return {
  {
    "folke/flash.nvim",

    -- 使用 s 跳转到单词
    -- 使用 R 选中一个段落
    keys = {
      -- { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "x", "o" }, false },
      {
        "R",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
}
