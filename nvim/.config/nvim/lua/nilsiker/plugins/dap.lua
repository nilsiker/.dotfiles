return {
    'mfussenegger/nvim-dap',
    dependencies = { 'theHamsta/nvim-dap-virtual-text' },
    config = function()
        local dap = require('dap')

        dap.adapters.godot = {
            type = "server",
            host = '127.0.0.1',
            port = 6006,
        }

        dap.configurations.gdscript = {
            {
                type = "godot",
                request = "launch",
                name = "Launch scene",
                project = "${workspaceFolder}"
            }
        }
        vim.keymap.set("n", "db", dap.toggle_breakpoint)
        vim.keymap.set("n", "<F5>", dap.continue)
        vim.keymap.set("n", "<F8>", dap.close)
        vim.keymap.set("n", "<F9>", dap.step_over)
        vim.keymap.set("n", "<F10>", dap.step_into)

        require("nvim-dap-virtual-text").setup({})
    end
}
