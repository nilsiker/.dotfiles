if not vim.lsp.get_clients({ bufnr = 0 })[1] then
    local port = os.getenv('GDScript_Port') or '6005'
    local cmd = { 'ncat', '127.0.0.1', port }
    local pipe = '/tmp/godot.pipe'
    vim.lsp.start({
        name = 'Godot',
        cmd = cmd,
        root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
        on_attach = function(client, bufnr)
            local servers = vim.fn.serverlist()
            if not vim.tbl_contains(servers, pipe) then
                vim.fn.serverstart(pipe)
            end
        end
    })


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
end
