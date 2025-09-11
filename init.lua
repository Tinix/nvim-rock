--
-- init.lua
-- Neovim configuration with lazy.nvim
-- Author: Daniel Tinivella
--

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- Load core configuration
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Setup lazy.nvim
require("lazy").setup({ import = "plugins"}, {
  -- Lazy.nvim configuration
  defaults = {
    lazy = false, -- should plugins be lazy-loaded?
    version = false, -- always use the latest git commit
  },
  install = {
    colorscheme = { "tokyonight", "catppuccin", "catppuccin-latte", "gruvbox" },
  },
  checker = {
    enabled = true, -- automatically check for plugin updates
    notify = false, -- don't notify about updates
  },
  change_detection = {
    notify = false, -- don't notify about config file changes
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
