return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local builtin = require('telescope.builtin')
        local utils = require 'telescope.utils'
        local cwd = utils.buffer_dir()

        vim.keymap.set('n', '<leader>pf', function() builtin.find_files({ cwd = cwd }) end)
        vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({
                search = vim.fn.input("Grep > "),
                cwd = cwd
            })
        end)
        vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols)
        vim.keymap.set("n", "<leader>pt", builtin.treesitter)
        vim.keymap.set("n", "<leader>pd", builtin.diagnostics)
    end
}
