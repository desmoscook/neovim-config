-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- quick resize windows size
vim.keymap.set("n", "<up>", ":res +5<CR>", { noremap = true })
vim.keymap.set("n", "<down>", ":res -5<CR>", { noremap = true })
vim.keymap.set("n", "<left>", ":vertical resize -5<CR>", { noremap = true })
vim.keymap.set("n", "<right>", ":vertical resize +5<CR>", { noremap = true })

-- use <ESC> to quit terminal mode
vim.keymap.set("t", "<Esc>", "<c-\\> <c-n>")
vim.api.nvim_set_keymap("t", "<Esc>", ":noh<CR>", { noremap = true, silent = true })

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
-- vim.keymap.set("n", "<leader>gg", "<cmd>Neogit cwd=%:p:h<CR>", { desc = "Neogit(curr file" })
