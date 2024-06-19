return {
	{ "gennaro-tedesco/nvim-peekup" },
	{
		"mg979/vim-visual-multi",
	},
	{
		"jvgrootveld/telescope-zoxide",
	},
	{
		"luukvbaal/nnn.nvim",
		lazy = false,
		config = function()
			require("nnn").setup()
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {},
	},
}
