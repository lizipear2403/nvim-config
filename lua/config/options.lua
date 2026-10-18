vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.updatetime = 100
vim.opt.timeoutlen = 300
vim.opt.incsearch = true -- show matches as you type
vim.opt.cmdheight = 2
vim.opt.undofile = true
vim.opt.swapfile = true
vim.opt.autoread = true -- auto-reload changes if outside of neovim
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 10
vim.opt.spell = false
vim.opt.iskeyword:append("-") -- include - in words
vim.opt.cursorline = true     -- highlight current line
vim.opt.path:append("**")     -- include subdirs in search
vim.opt.wrap = false
vim.opt.sidescrolloff = 10    -- keep 10 lines to left/right of cursor
vim.g.haskell_enable_quantification = 1
vim.g.haskell_enable_recursivedo = 1
vim.opt.modifiable = true -- allow buffer modifications
vim.g.haskell_enable_arrowsyntax = 1
vim.g.haskell_enable_pattern_synonyms = 1
vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right
vim.g.haskell_enable_typeroles = 1
vim.g.haskell_enable_static_pointers = 1
vim.opt.signcolumn = "yes" -- always show a sign column
--------------------------------------------------------------------------------
