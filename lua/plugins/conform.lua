return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			haskell = { "fourmolu" },
			json = { "jq" },
			markdown = { "prettier" },
			python = { "ruff_format" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			sh = { "shfmt" },
		},
		format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = true,
		},
	},
}
