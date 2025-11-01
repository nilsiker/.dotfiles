return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        vim.keymap.set("n", "<leader>gA", function() vim.cmd("Git add *") end)
        vim.keymap.set("n", "<leader>gd", function() vim.cmd("Git diff") end)
        vim.keymap.set("n", "<leader>gC", function() vim.cmd("Git commit") end)
        vim.keymap.set("n", "<leader>gP", function() vim.cmd("Git push") end)
        vim.keymap.set("n", "<leader>gb", function() vim.cmd("Git branch") end)
        vim.keymap.set("n", "<leader>gc", function() vim.cmd("Git checkout " .. vim.fn.input("Checkout: ")) end)
    end

}
