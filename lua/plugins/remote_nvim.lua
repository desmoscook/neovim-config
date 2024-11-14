local remote_nvim = function()
  require("remote-nvim").setup()
end

return {
  "amitds1997/remote-nvim.nvim",
  tag = "v0.0.1",
  config = remote_nvim,
  event = "VeryLazy",
  -- dev = true,
}
