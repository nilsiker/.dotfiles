return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        explorer = {
            enabled = true,
        },
        picker = {
            sources = {
                explorer = {
                    auto_close = true,
                    layout = {
                        layout = {
                            position = "right"
                        }
                    },
                }
            }
        },
        image = { enabled = true }
    },
    keys = {
        { '<leader>b', function() Snacks.explorer() end }

    }
}
