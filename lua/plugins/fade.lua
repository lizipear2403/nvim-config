-- lazy.nvim
return {
    "Fau818/fade.nvim",
    event = { "LspAttach", "InsertEnter" },
    opts = {},

    dependencies = {
        { "zbirenbaum/copilot.lua", optional = true },
        { "Saghen/blink.cmp",       optional = true },
    },
}
