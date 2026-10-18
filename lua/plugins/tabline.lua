return {
    {
        "akinsho/bufferline.nvim",
        enabled = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("bufferline").setup({
                options = {
                    show_buffer_close_icons = false,
                    separator_style = "slope",
                    always_show_bufferline = true,
                    diagnostics = "nvim_lsp",
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "Files",
                            text_align = "center",
                            separator = true,
                        },
                    },
                    show_tab_indicators = true,
                },
            })
            -- <leader>1-9 跳到第N个可见buffer
            for i = 1, 9 do
                vim.keymap.set("n", string.format("<leader>%d", i), function()
                    require("bufferline").go_to(i, true)
                end, { desc = "BufferLine GoTo " .. i })
            end

            -- <leader>bp 字母pick跳转
            vim.keymap.set("n", "<leader>bp", require("bufferline").pick, { desc = "BufferLine Pick" })
            --
            -- -- <leader>\ 关闭当前标签
            -- vim.keymap.set("n", "<leader>\\", "<cmd>bd!<CR>", { desc = "BufferLine Close" })
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = false,
    },
    {
        "onsails/lspkind.nvim"
    }
}
