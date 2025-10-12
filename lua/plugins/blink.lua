-- example from LazyVim(dont work)
-- https://github.com/LazyVim/starter/blob/888600e7ff4b0d8be0db18db932632830bfb7804/lua/plugins/example.lua#L218

-- issue for tab completion
-- https://github.com/LazyVim/LazyVim/discussions/250
--
-- this explain what is supertab
-- https://github.com/LazyVim/LazyVim/discussions/250#discussioncomment-9769360 

return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",
      ['<Tab>'] = { 'accept', 'fallback' },

      -- tab for cycle
      -- ["<Tab>"] = { "select_next", "fallback" },
      -- ["<S-Tab>"] = { "select_prev", "fallback" },
      -- ['<CR>'] = { 'accept', 'fallback' },
    },
  },
}
