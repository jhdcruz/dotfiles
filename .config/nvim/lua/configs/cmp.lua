local cmp = require('cmp')

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))

    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },

    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ["<leader-TAB>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end),
        ["<leader-`>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end),
    },

    sources = {
        { name = "copilot",   group_index = 3 },
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
