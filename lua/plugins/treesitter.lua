-- ~/.config/nvim/lua/plugins/treesitter.lua
-- 【已修复】tree-sitter-haskell 解析器已更新至 commit 98aedbd，修复了 strict-aliasing 违规导致的 malloc 堆损坏问题

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local ts = require("nvim-treesitter")

		-- 重新启用 haskell：parser 已修复 strict-aliasing 导致的堆损坏问题
		ts.install({
			"bash",
			"c",
			"cpp",
			"css",
			"dockerfile",
			"go",
			"haskell",
			"html",
			"javascript",
			"json",
			"latex",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"rst",
			"rust",
			"toml",
			"typescript",
			"vim",
			"yaml",
		})

		vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
			pattern = "*",
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
