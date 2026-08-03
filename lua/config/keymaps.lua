-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- window resize mode: <Leader>wr to enter, then hjkl to resize, q/Esc to exit
local resize_mode = false
local function exit_resize_mode()
  resize_mode = false
  vim.keymap.del("n", "h", { buffer = 0 })
  vim.keymap.del("n", "j", { buffer = 0 })
  vim.keymap.del("n", "k", { buffer = 0 })
  vim.keymap.del("n", "l", { buffer = 0 })
  vim.keymap.del("n", "q", { buffer = 0 })
  vim.keymap.del("n", "<Esc>", { buffer = 0 })
  vim.notify("Resize mode OFF", vim.log.levels.INFO)
end

vim.keymap.set("n", "<Leader>wr", function()
  if resize_mode then return end
  resize_mode = true
  local opts = { buffer = 0, nowait = true }
  vim.keymap.set("n", "h", "<cmd>vertical resize -3<CR>", opts)
  vim.keymap.set("n", "l", "<cmd>vertical resize +3<CR>", opts)
  vim.keymap.set("n", "j", "<cmd>resize -3<CR>", opts)
  vim.keymap.set("n", "k", "<cmd>resize +3<CR>", opts)
  vim.keymap.set("n", "q", exit_resize_mode, opts)
  vim.keymap.set("n", "<Esc>", exit_resize_mode, opts)
  vim.notify("Resize mode ON (hjkl to resize, q/Esc to exit)", vim.log.levels.INFO)
end, { desc = "Window resize mode" })

vim.keymap.set("i", "jk", "<ESC>", { noremap = true })

-- terminal mode
-- 设置 <C-[> 为 <Esc>
pcall(vim.keymap.del, "t", "<Esc>")
-- <Esc><Esc> 推出 terminal模式
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
-- terminal mode 使用 Ctrl + hjkl 来切换窗口
vim.keymap.set("t", "<C-h>", function() vim.cmd.wincmd("h") end, { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", function() vim.cmd.wincmd("j") end, { desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", function() vim.cmd.wincmd("k") end, { desc = "Go to upper window" })
vim.keymap.set("t", "<C-l>", function() vim.cmd.wincmd("l") end, { desc = "Go to right window" })

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
