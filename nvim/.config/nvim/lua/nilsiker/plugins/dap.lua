return {
    'theHamsta/nvim-dap-virtual-text',
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
        local dap = require('dap')
        vim.keymap.set("n", "db", dap.toggle_breakpoint)
        vim.keymap.set("n", "<F5>", dap.continue)
        vim.keymap.set("n", "<F8>", dap.close)
        vim.keymap.set("n", "<F9>", dap.step_over)
        vim.keymap.set("n", "<F10>", dap.step_into)

        require("nvim-dap-virtual-text").setup({})
    end
}
