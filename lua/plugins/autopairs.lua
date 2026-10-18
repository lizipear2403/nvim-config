return {
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
            })
        end,
    },
    {
        "echasnovski/mini.surround",
        config = function()
            require("mini.surround").setup()
        end,
    },
}
