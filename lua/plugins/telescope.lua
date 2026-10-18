return {
    "nvim-telescope/telescope.nvim",
    keys = {
        {
            "<leader>fl",
            function()
                require("telescope.builtin").builtin()
            end
        },
        {
            "<leader>dg",
            function()
                require("telescope.builtin").diagnostics()
            end
        },
        {
            "<leader>rg",
            function()
                require("telescope.builtin").registers()
            end
        },
        {
            "<leader>fm",
            function()
                require("telescope.builtin").marks()
            end
        },
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Find files",
        },
        {
            "<leader>mp",
            function()
                require("telescope.builtin").man_pages()
            end
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Live grep",
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "Find buffers",
        },
        {
            "<leader>fh",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "Help tags",
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })
        require("telescope").load_extension("fzf")
    end,
}
