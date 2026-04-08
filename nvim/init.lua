vim.g.mapleader = " "
vim.g.maplocalleader = " "

local config = vim.fn.stdpath("config")
package.path = package.path
  .. ";" .. config .. "/lua/?.lua"
  .. ";" .. config .. "/lua/?/init.lua"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins.ui" },
  { import = "plugins.navigation" },
  { import = "plugins.editing" },
  { import = "plugins.lsp" },
  { import = "plugins.bacon" },
})

require("config.options")
require("config.keymaps").register()
