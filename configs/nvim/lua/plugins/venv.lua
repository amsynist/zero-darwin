return {
	"linux-cultist/venv-selector.nvim",
	cmd = "VenvSelect",
	opts = function(_, opts)
		return vim.tbl_deep_extend("force", opts, {
			name = {
				"venv",
				".venv",
				"env",
				".env",
			},
		})
	end,
}
