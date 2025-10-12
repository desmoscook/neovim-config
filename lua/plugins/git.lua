return {
  {
    "sindrets/diffview.nvim",
    config = function()
      -- Diffview key mappings
      -- local map = vim.api.nvim_set_keymap
      -- local opts = { noremap = true, silent = true }
      -- map('n', '<leader>do', ':DiffviewOpen<CR>', opts)
      -- map('n', '<leader>dc', ':DiffviewClose<CR>', opts)
      -- map('n', '<leader>df', ':DiffviewFileHistory<CR>', opts)
    end,
  },
  { "tpope/vim-fugitive" },
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
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
    config = function()
      vim.g.flog_default_opts = {
        date = "short",
        -- flog 默认的格式
        format = "%ad [%h] {%an}%d %s",
        -- format = '%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'
      }
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
    },
    -- config = function()
      -- local neogit = require("neogit")

      -- -- 设置 <leader>gg 打开 neogit（项目根目录）
      -- vim.keymap.set("n", "<leader>gg", function()
      --   neogit.open({ kind = "split" }) -- 默认在项目根目录打开
      -- end, { desc = "Neogit (root dir)" })
      --
      -- -- 设置 <leader>gG 打开 neogit（当前工作目录 cwd）
      -- vim.keymap.set("n", "<leader>gG", function()
      --   neogit.open({ cwd = vim.fn.getcwd(), kind = "split" }) -- 在当前目录打开
      -- end, { desc = "Neogit (cwd)" })
    -- end,
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
}
