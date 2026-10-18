-- ~/.config/nvim/lua/plugins/git.lua

return {
    -- 显示 git diff 符号在 signcolumn
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
        enable = false,
        config = function()
            require("gitsigns").setup({
                -- signs = {
                --   add = { text = "│" },
                --   change = { text = "│" },
                --   delete = { text = "_" },
                --   topdelete = { text = "‾" },
                --   changedelete = { text = "~" },
                -- },
                on_attach = function(bufnr)
                    vim.keymap.set(
                        "n",
                        "<leader>gp",
                        require("gitsigns").preview_hunk,
                        { buffer = bufnr, desc = "Preview git hunk" }
                    )
                    vim.keymap.set(
                        "n",
                        "<leader>gb",
                        require("gitsigns").blame_line,
                        { buffer = bufnr, desc = "Git blame" }
                    )
                end,
            })
        end,
    },

    {
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit",
        enable = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        -- keys = {
        --     { "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
        -- },
    },
}
