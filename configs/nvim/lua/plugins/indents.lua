return {
	{
		"indent-blankline.nvim",
		enabled = false,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
	},
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({
				chunk = {
					enable = true,
					-- ...
				},
				line_num = {
					enable = true,
				},
				indent = {
					enable = true,
					chars = {
						"│",
					},
					style = {
						vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
					},
				},
			})
		end,
	},
}
