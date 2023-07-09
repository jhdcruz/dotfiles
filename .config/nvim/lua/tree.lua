local tree = require("nvim-tree.api")

local function edit_or_open()
    local node = tree.tree.get_node_under_cursor()

    if node.nodes ~= nil then
        -- expand or collapse folder
        tree.node.open.edit()
    else
        -- open file
        tree.node.open.edit()
        -- Close the tree if file was opened
        tree.tree.close()
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

function TreeAttach(bufnr)
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
