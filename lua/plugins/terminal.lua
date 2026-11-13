return {
    "akinsho/toggleterm.nvim",
    version = false,
    lazy = false,
    cmd = {
        "ToggleTerm",
        "ToggleTermToggleAll",
        "TermExec",
        "TermNew",
        "TermSelect",
        "ToggleTermSetName",
    },
    opts = {
        on_open = function(term)
        end,
        size = function(term)
            if term.direction == "vertical" then
                return vim.o.columns * 0.35
            elseif term.direction == "horizontal" then
                return 15
            end
        end,
        direction = "vertical",
        -- open_mapping = [[<c-\>]],
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        persist_mode = true,
        close_on_exit = true,
        auto_scroll = true,
        shade_terminals = true,
        shading_factor = -30,
        highlights = {
            NormalFloat = { link = "Normal" },
            FloatBorder = { link = "FloatBorder" },
        },
        float_opts = {
            border = "rounded",
            winblend = 0,
            title_pos = "center",
        },
        winbar = {
            enabled = true,
        },


    },
    vim.keymap.set("v", "<leader>s", "<cmd>ToggleTermSendVisualSelection<CR>"),
    vim.keymap.set("n", "<leader>tn", "<cmd>TermNew<CR>"),
    vim.keymap.set("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>"),
    vim.keymap.set("n", "<leader>tr", ":ToggleTermSetName")
}
