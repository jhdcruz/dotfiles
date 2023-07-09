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
vim.opt.textwidth = 0
vim.opt.cmdheight = 0
vim.opt.expandtab = true
vim.opt.shell = "/bin/zsh"

-- split panels
vim.opt.splitbelow = true
vim.opt.splitright = true

-- split panels using alt + hjkl
vim.api.nvim_set_keymap("n", "<M-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-l>", "<C-w>l", { noremap = true })

-- Lazy plugins setup
require("lazy").setup(Plugins)
