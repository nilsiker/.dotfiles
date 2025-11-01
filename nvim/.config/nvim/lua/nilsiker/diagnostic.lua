vim.diagnostic.config({
    -- update_in_insert = true,

    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
    },
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>dp', function()
    vim.diagnostic.goto_prev({ count = 1, float = true })
end)
vim.keymap.set('n', '<leader>dn', function()
    vim.diagnostic.goto_next({ count = -1, float = true })
end)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
