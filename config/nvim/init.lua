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

vim.opt.rtp:prepend(lazypath)

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set map leader
vim.g.mapleader = " "
vim.opt.termguicolors = true

-- PLUGINS

require("lazy").setup({
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
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "antosha417/nvim-lsp-file-operations",
        },
        config = function()
            require("nvim-tree").setup {
                disable_netrw = true,
                hijack_netrw = true,
                open_on_tab = false,
                hijack_cursor = false,
                update_cwd = false,
                update_focused_file = {
                    enable = true,
                    update_cwd = false,
                    ignore_list = {}
                },
                system_open = {
                    cmd = nil,
                    args = {}
                },
                view = {
                    width = 30,
                    side = "left",
                    mappings = {
                        custom_only = false,
                        list = {}
                    }
                },
                filters = {
                    custom = {
                        "^.git$",
                        "^node_modules$",
                        "^.idea$",
                    }
                }
            }
        end
    },
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
            local cmp = require('cmp')
            cmp.setup {
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end
                },
                mapping = {
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<Tab>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif vim.fn["vsnip#available"](1) == 1 then
                            vim.fn.feedkeys(
                                vim.api.nvim_replace_termcodes('<Plug>(vsnip-expand-or-jump)', true, true, true), '')
                        else
                            fallback()
                        end
                    end,
                    ['<S-Tab>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-jump-prev)', true, true, true),
                                '')
                        else
                            fallback()
                        end
                    end,
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'nvim_lua' },
                    { name = 'calc' },
                    { name = 'emoji' },
                    { name = 'look' },
                    { name = 'treesitter' },
                    { name = 'cmdline' },
                    { name = 'ultisnips' },
                    { name = 'words' },
                }
            }
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
    }
})

-- MAPPINGS

-- nvim-tree
local api = require("nvim-tree.api")

local function edit_or_open()
    local node = api.tree.get_node_under_cursor()

    if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
    else
        -- open file
        api.node.open.edit()
    end
end

-- open as vsplit on current node
local function vsplit_preview()
    local node = api.tree.get_node_under_cursor()

    if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
    else
        -- open file as vsplit
        api.node.open.vertical()
    end

    -- Finally refocus on tree if it was lost
    api.tree.focus()
end

vim.keymap.set('n', '<A-1>', ':NvimTreeToggle<CR>', { silent = true, noremap = true })
-- nvim-tree mappings defined in local functions above
vim.keymap.set("n", "l", edit_or_open)
vim.keymap.set("n", "L", vsplit_preview)
vim.keymap.set("n", "h", api.tree.close)
vim.keymap.set("n", "H", api.tree.collapse_all)

-- Telescope mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- LSP mappings
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
