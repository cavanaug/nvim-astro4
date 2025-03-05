-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
end

require("lazy_setup")

--- This is not the recommended way to load configs in Astrovim but its how I want to do it
require("config/options")
require("config/autocmds")
require("config/keymaps")

-- require("user/utils")
-- require("user/mappings")

require("polish")

-- HACK: This is a crazy hack to force clipboard, somehow it was getting set to unnamedplus and I couldnt stop it
vim.defer_fn(function()
    vim.opt.clipboard = ""
end, 100)
