return {
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 1000,
			stages = "slide",
			render = "compact",
			top_down = false,
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			filesystem = {
				filtered_items = {
					visible = true,
				},
			},
		},
	},

	{
		"akinsho/toggleterm.nvim",
		opts = {
			size = 5,
			shade_terminals = true,
			persist_mode = true,
			persist_size = false,
			start_in_insert = true,
			float_opts = {
				border = "curved",
				width = 100,
				height = 25,
				title_pos = "left",
			},
		},
	},
}
