local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<leader>c", "<Cmd>nohlsearch<CR>", opts)
-- vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("t", "jk", "<C-\\><C-n>", opts)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })
vim.keymap.set("n", "<C-=>", "<C-w>=", opts)     -- 等分所有窗口
vim.keymap.set("n", "<C-Up>", "<C-w>+", opts)    -- 增加高度
vim.keymap.set("n", "<C-Down>", "<C-w>-", opts)  -- 减少高度
vim.keymap.set("n", "<C-Left>", "<C-w><", opts)  -- 减少宽度
vim.keymap.set("n", "<C-Right>", "<C-w>>", opts) -- 增加宽度

local trim_spaces = true

vim.keymap.set("v", "<leader>s",
    -- function()
    --     require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
    -- end
    ":ToggleTermSendVisualSelection "
)

vim.keymap.set("n", "<C-/>", "gcc")

vim.keymap.set("n", "<M-J>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<M-K>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<M-J>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<M-K>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
-- vim.keymap.set("n", "nb", "%")
-- vim.keymap.set("v", "nb", "%")

vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

vim.keymap.set("n", "j", function()
    return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })

vim.keymap.set("n", "k", function()
    return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

vim.keymap.set("n", "<leader>pa", function() -- show file path
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    print("file:", path)
end, { desc = "Copy full file path" })
