-- ~/.config/nvim/init.lua

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- lazy.nvim 自动安装引导
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- 初始化 lazy.nvim（暂无插件，仅初始化）
require("lazy").setup({
    spec = { import = "plugins" },
    rocks = { enabled = false },
    defaults = { lazy = false },
    checker = { enabled = true, notify = false },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
require("config.tele")
