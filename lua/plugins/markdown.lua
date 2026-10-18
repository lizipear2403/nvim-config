return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		ft = { "markdown" },
		opts = {
			preset = "obsidian",
			render_modes = { "n", "c", "t" },
			latex = {
				converter = { "latex2text-wrapper", "latex2text" },
			},
			anti_conceal = {
				enabled = true,
				ignore = { latex = true },
			},
			heading = { sign = false },
			code = {
				width = "block",
				border = "thin",
			},
			pipe_table = { preset = "round" },
		},
		config = function(_, opts)
			require("render-markdown").setup(opts)
			vim.api.nvim_create_user_command("Mt", ":RenderMarkdown toggle", {})
		end,
	},
	{
		"dhruvasagar/vim-table-mode",
		ft = { "markdown" },
		config = function()
			vim.g.table_mode_corner = "|"
		end,
	},
}
