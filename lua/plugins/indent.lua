return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    opts = {
        indent = {
            char = "▏",
            tab_char = "▏",
            smart_indent_cap = true,
        },
        scope = {
            enabled = true,
            show_start = true,
            show_end = true,
            injected_languages = true,
            highlight = { "Function", "Label" },
            priority = 500,
        },
    },
}
