-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
  vim.opt.guifont = { "Berkeley Mono", ":h18" }
end

local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
if not vim.loop.fs_stat(pipepath) then
  vim.fn.serverstart(pipepath)
end
