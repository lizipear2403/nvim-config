return {
    {
        'uloco/bluloco.nvim',
        lazy = false,
        priority = 1000,
        dependencies = { 'rktjmp/lush.nvim' },
        opts = function()
            require("bluloco").setup({
                style = "dark", -- "auto" | "dark" | "light"
                transparent = false,
                italics = false,
                terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
                guicursor = true,
                float_window = "default"                   -- "default" | "transparent"
            })
            require('lualine').setup({
                options = {
                    theme = 'auto'
                }
            })
            vim.opt.termguicolors = true
            vim.cmd('colorscheme bluloco')
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = false,
    },
    {
        "onsails/lspkind.nvim"
    },
}
