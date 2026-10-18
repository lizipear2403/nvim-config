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
            -- ~/.config/nvim/after/ftplugin/haskell.lua
            -- haskell-language-server relies heavily on codeLenses,
            -- so auto-refresh (see advanced configuration) is enabled by default
            -- vim.keymap.set('n', '<space>cl', vim.lsp.codelens.run, opts)
            -- Hoogle search for the type signature of the definition under the cursor
            -- vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
            -- Toggle a GHCi repl for the current package
            -- vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)
            -- Toggle a GHCi repl for the current buffer
            -- vim.keymap.set('n', '<leader>rf', function()
            --     ht.repl.toggle(vim.api.nvim_buf_get_name(0))
            -- end, opts)
            -- vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)
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
