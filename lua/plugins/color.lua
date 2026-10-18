-- return {
--     "loctvl842/monokai-pro.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("monokai-pro").setup()
--         vim.cmd.colorscheme("monokai-pro-machine")
--         vim.api.nvim_set_hl(
--             0, "MatchParen",
--             {
--                 blend = 100, reverse = true
--             }
--         )
--     end,
-- }

-- "nyoom-engineering/oxocarbon.nvim",
-- build = false,
-- "Shatur/neovim-ayu"
-- "cpwrs/americano.nvim"
-- Add in any other configuration;
--   event = foo,
--   config = bar
--   end,

return {
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
}
-- {
-- "glepnir/zephyr-nvim",
-- enabled = true,
-- lazy = false,
-- config = function()
--     vim.cmd.colorscheme("zephyr")
--     vim.api.nvim_set_hl(
--         0, "MatchParen",
--         {
--             blend = 100, reverse = true
--         }
--     )
-- end,
-- }
