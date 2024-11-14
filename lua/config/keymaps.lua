-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 在normal模式,使用<leader>sx打开telescope.builtin.resume
-- vim.keymap.set(
--   "n",
--   "<leader>sx",
--   require("telescope.builtin").resume,
--   { noremap = true, silent = true, desc = "Resume" }
-- )

-- let cursor in vertical center
vim.keymap.set("n", "<esc>", ":noh<cr>zz")
vim.keymap.set("n", "j", "gjzz")
vim.keymap.set("n", "k", "gkzz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "<s-n>", "<s-n>zz")
vim.keymap.set("n", "*", "*zz", { noremap = true })
vim.keymap.set("n", "#", "#zz", { noremap = true })
vim.keymap.set("n", "<c-o>", "<c-o>zz", { noremap = true })
vim.keymap.set("n", "<c-i>", "<c-i>zz", { noremap = true })
vim.keymap.set("n", "G", "Gzz", { noremap = true })

-- 在normal模式,使用<leader>qf 调用 lsp 的code_action
local opts = { noremap = true, silent = true }

local function quickfix()
  vim.lsp.buf.code_action({
    filter = function(a)
      return a.isPreferred
    end,
    apply = true,
  })
end

vim.keymap.set("n", "<leader>qf", quickfix, opts)
