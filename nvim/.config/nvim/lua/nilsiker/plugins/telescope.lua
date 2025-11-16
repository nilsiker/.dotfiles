return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local builtin = require('telescope.builtin')
        local utils = require 'telescope.utils'

        vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
        vim.keymap.set("n", "<leader>pt", builtin.treesitter)
    end
}
