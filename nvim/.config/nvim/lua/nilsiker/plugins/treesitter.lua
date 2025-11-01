return {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "lua", "vim", "vimdoc", "rust", "html", "css", "jsonc", "gdscript" },
            auto_install = false,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true }
        })
    end
}
