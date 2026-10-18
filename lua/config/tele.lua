local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local builtin = require("telescope.builtin")

local menuGen = function(pick)
    local opts = require("telescope.themes").get_ivy {} -- 这里使用了漂亮的下拉样式
    return {
        pickers.new(opts, {
            prompt_title = "Git 工具箱",
            finder = finders.new_table {
                results = pick,
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = entry[1], -- 列表中显示的文本
                        ordinal = entry[1], -- 搜索过滤时匹配的文本
                    }
                end
            },

            sorter = conf.generic_sorter(opts),

            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(function()
                    actions.close(prompt_bufnr) -- 选中后先关闭当前菜单弹窗

                    local selection = action_state.get_selected_entry()
                    local target_picker = selection.value[2] -- 拿到对应的内置函数

                    target_picker()
                end)
                return true
            end,
        }):find()
    }
end

local gitPickers = {
    { "Git Files   (查找 Git 管理的文件)", builtin.git_files },
    { "Git Status  (查看并管理文件状态)", builtin.git_status },
    { "Git Commits (查看全项目提交历史)", builtin.git_commits },
    { "Git Branch  (切换/查看 Git 分支)", builtin.git_branches },
    { "Git Stash   (查看暂存区列表)", builtin.git_stash },
}

local lspPickers = {
    { "Type Def",        builtin.lsp_type_definitions },
    { "Implementation",  builtin.lsp_type_definitions },
    { "lsp_definitions", builtin.lsp_definitions },
    { "lsp_references",  builtin.lsp_references },
}

local gitpick = function()
    return (menuGen(gitPickers))
end

local lspPick = function()
    return (menuGen(lspPickers))
end
-- 2. 绑定一个唯一的快捷键（例如 <leader>g）来唤醒这个子菜单
vim.keymap.set("n", "<leader>g", gitpick, { desc = "打开 Git Pickers 子菜单" })
vim.keymap.set("n", "<leader>lp", lspPick, { desc = "打开 LSP Pickers 子菜单" })
-- vim.keymap.set("n", "<leader>bb", lspPick, { desc = "打开 LSP Pickers 子菜单" })
-- vim.keymap.set("n", "<leader>t", gitpick, { desc = "打开 Git Pickers 子菜单" })
