return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local ts = require("nvim-treesitter")

        ts.install({
            "bash",
            "c",
            "cpp",
            "css",
            "dockerfile",
            "go",
            "haskell",
            "html",
            "javascript",
            "json",
            "latex",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "rst",
            "rust",
            "toml",
            "typescript",
            "vim",
            "yaml",
        })

        vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
            pattern = "*",
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
