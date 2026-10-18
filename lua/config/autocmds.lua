local autgroup = vim.api.nvim_create_augroup("AutoCmds", { clear = true })
--highlight Yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = autgroup,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

--gitcommit / markdown 换行
vim.api.nvim_create_autocmd("FileType", {
	group = autgroup,
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
	end,
})
