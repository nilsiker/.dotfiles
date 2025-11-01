return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- optionally enable 24-bit colour
        vim.opt.termguicolors = true

        vim.keymap.set("n", "<leader>b", vim.cmd.NvimTreeFocus)

        -- empty setup using defaults
        require("nvim-tree").setup({
            view = {
                side = "right"
            }
        })
    end
}
