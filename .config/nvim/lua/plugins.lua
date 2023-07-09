---@diagnostic disable: different-requires

Plugins = {
    "folke/which-key.nvim",
    "folke/neodev.nvim",
    "nvim-lua/plenary.nvim",
    "wakatime/vim-wakatime", -- will prompt for api key on first run

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
        "zbirenbaum/copilot.lua",
        config = function()
            require("configs.copilot")
            require("copilot").setup(CopilotSetup)
        end
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "antosha417/nvim-lsp-file-operations",
        },
        config = function()
            require("configs.tree")
            require("nvim-tree").setup(TreeSetup)
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                highlight = {
                    enable = true
                }
            }
        end
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
            require("configs.telescope")
        end
    },

    -- LSP, Linters, Formatters
    {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-emoji",
            "hrsh7th/cmp-look",
            "hrsh7th/cmp-omni",
            "hrsh7th/cmp-treesitter",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-ultisnips",
            "hrsh7th/cmp-words",
        },
        config = function()
            require("configs.cmp")
        end
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        requires = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers {}
        end
    },
    {
        "neovim/nvim-lspconfig",
        requires = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("configs.lspconfig")
        end
    },
    {
        -- lsp-file-operations
        "antosha417/nvim-lsp-file-operations",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "kyazdani42/nvim-tree.lua" },
        },
        config = function()
            require("lsp-file-operations").setup {}
        end
    }
}
