return {
    'mrcjkb/rustaceanvim',
    ft = "rust",
    version = '^5', -- Recommended
    lazy = true,    -- This plugin is already lazy
    config = function()
        local bufnr = vim.api.nvim_get_current_buf()
        vim.keymap.set(
            "n",
            "<leader>a",
            function()
                vim.cmd.RustLsp('codeAction')
            end,
            { silent = true, buffer = bufnr }
        )
    end
}
