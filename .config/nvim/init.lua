require("plugins")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath
        }
    )
end


-- LAZY PRE-REQUISITES
vim.opt.rtp:prepend(lazypath)

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set map leader
vim.g.mapleader = " " -- Space
vim.opt.termguicolors = true

-- display settings
vim.opt.wrap = false
vim.opt.number = true

-- PLUGINS
require("lazy").setup(Plugins)
