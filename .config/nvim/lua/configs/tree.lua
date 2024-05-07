local tree = require("nvim-tree.api")

-- Global mappings for nvim-tree
vim.keymap.set('n', '<A>h', ':NvimTreeToggle<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>e', ':NvimTreeOpen<CR>', { silent = true, noremap = true })

local function edit_or_open()
    local node = tree.tree.get_node_under_cursor()

    if node.nodes ~= nil then
        -- expand or collapse folder
        tree.node.open.edit()
    else
        -- open file
        tree.node.open.edit()

        -- Close the tree if file was opened
        -- tree.tree.close()
    end
end

-- open as vsplit on current node
local function vsplit_preview()
    local node = tree.tree.get_node_under_cursor()

    if node.nodes ~= nil then
        -- expand or collapse folder
        tree.node.open.edit()
    else
        -- open file as vsplit
        tree.node.open.vertical()
    end

    -- Finally refocus on tree if it was lost
    tree.tree.focus()
end

local function TreeAttach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
    vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
    vim.keymap.set("n", "h", api.tree.close, opts("Close"))
    vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
end

TreeSetup = {
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
        width = 36,
        side = "left",
    },
    filters = {
        custom = {
            "^.git$",
            "^node_modules$",
            "^.idea$",
        }
    },
    renderer = {
        group_empty = true,
    },
    on_attach = TreeAttach
}
