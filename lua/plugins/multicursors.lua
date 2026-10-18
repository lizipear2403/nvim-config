return {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    enable = true,
    dependencies = {
        "nvimtools/hydra.nvim",
    },
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
        {
            mode = { "n", "v" },
            "<leader>m",
            "<cmd>MCstart<cr>",
            desc = "Multi cursor",
        },
        {
            "<leader>mc",
            "<cmd>MCclear<cr>",
            desc = "Clear multi cursors",
        },
        {
            "<leader>mp",
            "<cmd>MCpattern<cr>",
            desc = "Multi cursor by pattern",
        },
    },
    opts = {
        hint_config = {
            float_opts = {
                border = "rounded",
            },
        },
    },
}
