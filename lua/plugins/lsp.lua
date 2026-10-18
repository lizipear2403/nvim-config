-- ~/.config/nvim/lua/plugins/lsp.lua

return {
    -- 1. LSP 核心配置
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            -- 过滤 HLS 产出的 "Possible spelling issue" 伪阳性诊断
            local orig_publish = vim.lsp.handlers["textDocument/publishDiagnostics"]
            vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
                if result and result.diagnostics then
                    result.diagnostics = vim.tbl_filter(function(d)
                        return not d.message:match("Possible spelling issue")
                    end, result.diagnostics)
                end
                orig_publish(err, result, ctx, config)
            end
            vim.lsp.config("racket_langserver", {
                cmd = { "racket", "-l", "racket-langserver" },
                filetypes = { "racket", "scheme" }
            })
            vim.lsp.enable("racket_langserver")
            -- LSP 统一快捷键绑定
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
                    end
                    map("gd", vim.lsp.buf.definition, "Go to definition")
                    map("gr", vim.lsp.buf.references, "References")
                    map("K", vim.lsp.buf.hover, "Hover documentation")
                    map("<leader>rn", vim.lsp.buf.rename, "Rename")
                    -- map("<leader>ca", vim.lsp.buf.code_action, "Code action")
                    -- map("[d", function()
                    --     vim.diagnostic.jump({ count = -1, float = true })
                    -- end, "Previous diagnostic")
                    -- map("]d", function()
                    --     vim.diagnostic.jump({ count = 1, float = true })
                    -- end, "Next diagnostic")
                    map("<leader>f", function()
                        require("conform").format({ async = true, lsp_format = true })
                    end, "Format")
                end,
            })

            vim.diagnostic.config({
                virtual_text = false,
                signs = false,
                underline = false,
                severity_sort = true,
                float = { border = "rounded" },
            })
        end,
    },

    -- 2. Mason 包管理器
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        config = true,
    },

    -- 3. Mason-lspconfig 桥接与服务配置
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim", "nvim-lspconfig" },
        opts = {
            ensure_installed = {
                "clangd",
                "lua_ls",
                "pyright",
                "rust_analyzer",
                "gopls",
                "ts_ls",
                "jsonls",
                "yamlls",
                "bashls",
                "hls",
                "marksman",
            },
            automatic_enable = { exclude = { "hls" } },
            handlers = {
                -- 默认启动函数
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,


                -- [修复] 正确配置 clangd
                ["clangd"] = function()
                    require("lspconfig").clangd.setup({
                        cmd = {
                            "clangd",
                            "--header-insertion=never",
                            "--all-scopes-completion",
                            "--completion-style=detailed",
                        },
                    })
                end,

                -- [添加] 屏蔽 mason-lspconfig 自动启动 hls
                ["hls"] = function()
                    -- 留空！交由 haskell.lua 中的 haskell-tools 插件单独接管启动
                    return true
                end,
            },
        },
    },
}
