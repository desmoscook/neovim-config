return {
  -- use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in luasnip
  {
    "l3mon4d3/luasnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.configschema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<cr>"] = cmp.config.disable,
        ["<tab>"] = cmp.mapping.confirm({ select = true }),
        ["<c-j>"] = cmp.mapping(function(fallback) end, { "i", "s" }),
      })
    end,
  },
}
