return {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    -- event = "Newbuffer",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree (root dir)" },
        { "<leader>o", "<cmd>Neotree focus<cr>",  desc = "Focus NeoTree" },
        { "<leader>r", "<cmd>Neotree reveal<cr>", desc = "Reveal file in NeoTree" },
    },
    opts = {
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰜌",
            provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
                if node.type == "file" or node.type == "terminal" then
                    local success, web_devicons = pcall(require, "nvim-web-devicons")
                    local name = node.type == "terminal" and "terminal" or node.name
                    if success then
                        local devicon, hl = web_devicons.get_icon(name)
                        icon.text = devicon or icon.text
                        icon.highlight = hl or icon.highlight
                    end
                end
            end,
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            use_filtered_colors = true, -- Whether to use a different highlight when the file is filtered (hidden, dotfile, etc.).
        },
        close_if_last_window = true,
        enable_git_status = true,
        enable_diagnostics = true,
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        },
        auto_clean_after_session_restore = true,
    },
}
