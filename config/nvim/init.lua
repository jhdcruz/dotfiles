local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath
        }
      )
end

vim.opt.rtp:prepend(lazypath)

-- Set map leader
vim.g.mapleader = " "

-- PLUGINS

require("lazy").setup({
    "folke/which-key.nvim",
    "folke/neodev.nvim", 
    "nvim-lua/plenary.nvim",

    -- Themes
    "nvim-tree/nvim-web-devicons",
    {
      "Mofiqul/adwaita.nvim",
      lazy = false,
      priority = 1000,

      -- configure and set on startup
      config = function()
          vim.g.adwaita_disable_cursorline = true -- to disable cursorline
          vim.cmd('colorscheme adwaita')
      end
    },

    {
      "nvim-lualine/lualine.nvim",
      requires = {
          "Mofiqul/lualine-adwaita.nvim",
      },
      config = function()
          require("lualine").setup {
              options = {
                  theme = "adwaita",
              },
          }
      end
    },

    -- Code
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate"
    },

    {
      "lewis6991/gitsigns.nvim",
      config = function()
          require("gitsigns").setup()
      end
    },

    {
      "windwp/nvim-autopairs",
      config = function()
          require("nvim-autopairs").setup()
      end
    },

    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },

    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.2",
      dependencies = {
          "nvim-lua/popup.nvim",
          "nvim-lua/plenary.nvim",
      },
      requires = {
          "nvim-telescope/telescope-fzf-native.nvim",
      },
      config = function()
          require("telescope").setup {}
      end
    },
})

-- MAPPINGS
-- Telescope mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
