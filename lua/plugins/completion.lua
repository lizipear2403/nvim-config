local set_2 = {
    list = {
        selection = {
            preselect = true,
            auto_insert = true
        }
    },
    ghost_text = {
        enabled = true,
        show_with_menu = false
    },
    documentation = {
        auto_show = true
    },

    menu = {
        draw = {
            components = {
                kind_icon = {
                    text = function(ctx)
                        local icon = ctx.kind_icon
                        if vim.tbl_contains({ "path" }, ctx.source_name) then
                            local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                            if dev_icon then
                                icon = dev_icon
                            end
                        else
                            icon = require("lspkind").symbol_map[ctx.kind] or ""
                        end

                        return icon .. ctx.icon_gap
                    end,
                },
            },
            columns = {
                { "label",     "label_description", gap = 5 },
                { "kind_icon", "kind",              gap = 5 }
            },
        },
        border = "rounded"
    },
}


return {
    {
        "saghen/blink.cmp",
        version = "1.*",
        event = "InsertEnter",
        dependencies = { "rafamadriz/friendly-snippets" },
        opts = {
            keymap = {
                preset = "default",
                ['<Up>'] = { 'select_prev', "snippet_forward", 'fallback' },
                ['<C-n>'] = { 'select_prev', "snippet_forward", 'fallback' },
                ['<Down>'] = { 'select_next', "snippet_backward", 'fallback' },
                ["<C-y>"] = { "accept", "fallback" },
                ["<Tab>"] = { "accept", "fallback" },

            },
            sources = {
                default = { "lsp", "snippets", "buffer", "path" },
                per_filetype = {
                    haskell = { "lsp", "buffer" },
                    lhaskell = { "lsp", "buffer" },
                },
            },
            fuzzy = {
                implementation = "lua",
            },

            completion = set_2,
            signature = {
                enabled = true,
            },
        },
    },
}
