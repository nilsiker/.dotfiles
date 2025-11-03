return {
    'nvim-mini/mini.nvim',
    enabled = true,
    config = function()
        require 'mini.icons'.setup()
        require 'mini.git'.setup()
        require 'mini.diff'.setup()

        local statusline = require 'mini.statusline'


        local active_content = function()
            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
            local git           = statusline.section_git({ trunc_width = 40 })
            local diff          = statusline.section_diff({ trunc_width = 75 })
            local diagnostics   = statusline.section_diagnostics({
                icon = '',
                trunc_width = 75,
                signs = {
                    ERROR = '%#MiniIconsRed#󰅙 ',
                    INFO = '%#MiniIconsBlue#󰋼 ',
                    HINT = '%#MiniIconsCyan#󰌵 ',
                    WARN = '%#MiniIconsYellow# '
                }
            })
            local lsp           = statusline.section_lsp({ trunc_width = 75 })
            local fileinfo      = statusline.section_fileinfo({ trunc_width = 120 })
            local location      = statusline.section_location({ trunc_width = 75 })
            local search        = statusline.section_searchcount({ trunc_width = 75 })

            return statusline.combine_groups({
                { hl = mode_hl,                 strings = { mode } },
                { hl = 'MiniStatuslineDevinfo', strings = { diagnostics } },
                { hl = 'MiniStatuslineDevinfo', strings = { lsp } },
                '%<', -- Mark general truncate point
                { hl = 'MiniStatuslineFilename', strings = { '%t' } },
                '%=', -- End left alignment
                { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                { hl = mode_hl,                  strings = { git, diff } },
            })
        end

        local s = ''

        local active_content_string = active_content()
        print(active_content_string)

        statusline.setup {
            use_icons = true,
            content = {
                active = active_content,
                inactive = active_content
            }
        }
    end
}
