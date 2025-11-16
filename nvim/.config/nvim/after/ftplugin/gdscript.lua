if not vim.lsp.get_clients({ bufnr = 0 })[1] then
    -- LSP configuration for Godot's GDScript
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

    -- DAP configuration for Godot
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

    -- Auto-format on save using gdformat
    local function run_gdformat_async(bufnr)
        if vim.fn.executable("gdformat") == 0 then
            return
        end
        if not vim.api.nvim_buf_is_valid(bufnr) then return end
        local filename = vim.api.nvim_buf_get_name(bufnr)
        if filename == "" then return end

        vim.fn.jobstart({ "gdformat", filename }, {
            on_exit = function(_, exit_code, _)
                if not vim.api.nvim_buf_is_valid(bufnr) then return end

                if exit_code == 0 then
                    if vim.api.nvim_get_option_value("modified", {}) == false then
                        local ok, err = vim.cmd("silent! edit " .. vim.fn.fnameescape(filename))
                        if not ok then
                            vim.notify("gdformat: reload failed: " .. tostring(err), vim.log.levels.WARN)
                        end
                    end
                else
                    vim.notify("gdformat failed (exit " .. tostring(exit_code) .. ")", vim.log.levels.WARN)
                end
            end,
        })
    end

    local group = vim.api.nvim_create_augroup("GDScriptFormat", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = group,
        pattern = { "*.gd" },
        callback = function(args)
            run_gdformat_async(args.buf)
        end,
    })
end
