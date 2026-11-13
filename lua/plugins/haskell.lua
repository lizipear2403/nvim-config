-- ~/.config/nvim/lua/plugins/haskell.lua

return {
    {
        "neovimhaskell/haskell-vim",
        ft = { "haskell", "lhaskell", "cabal" },
        init = function()
            vim.g.haskell_enable_quantification = 1
            vim.g.haskell_enable_recursivedo = 1
            vim.g.haskell_enable_arrowsyntax = 1
            vim.g.haskell_enable_pattern_synonyms = 1
            vim.g.haskell_enable_typeroles = 1
            vim.g.haskell_enable_static_pointers = 1
            vim.g.haskell_classic_highlighting = 1
        end,
    },
    {
        "mrcjkb/haskell-tools.nvim",
        version = "^3",
        ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
        config = function()
            vim.g.haskell_tools = {
                tools = {
                    codeLens = {
                        autoRefresh = true,
                    },
                },
                hls = {
                    settings = {
                        haskell = {
                            plugin = {
                                ["ghcide-completions"] = {
                                    config = {
                                        -- autoExtendOn = true,
                                        snippetsOn = false
                                    },
                                },
                            },
                        },
                    },
                },
            }
        end,
    },
}
