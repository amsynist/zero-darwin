-- place this in one of your configuration file(s)
local hop = require("hop")
local directions = require("hop.hint").HintDirection
vim.keymap.set("", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "t", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set("", "T", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })

require("cmp").setup({
	sources = {
		{ name = "cmp_yanky" },
	},
})
local navbuddy = require("nvim-navbuddy")

local actions = require("nvim-navbuddy.actions")
navbuddy.setup({
	lsp = {
		auto_attach = true,
	},
	mappings = { ["<right>"] = actions.children(), ["<left>"] = actions.parent() },
})

require("conform").setup({
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

require("mini.ai").setup()
require("toggle-bool").setup({
	mapping = ";",
	additional_toggles = {
		Yes = "No",
		On = "Off",
		["0"] = "1",
		Enable = "Disable",
		Enabled = "Disabled",
		First = "Last",
		Before = "After",
		Persistent = "Ephemeral",
		Internal = "External",
		Ingress = "Egress",
		Allow = "Deny",
		All = "None",
		["=="] = "!=",
	},
})
require("oil").setup()
-- lua, default settings
require("better_escape").setup({
	mapping = { "jk", "jj" }, -- a table with mappings to use
	timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
	clear_empty_lines = false, -- clear line after escaping if there is only whitespace
	keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
	-- example(recommended)
	-- keys = function()
	--   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
	-- end,
})

require("rainbow-delimiters.setup").setup({
	highlight = {
		"RainbowDelimiterCyan",
		"RainbowDelimiterOrange",
		"RainbowDelimiterBlue",

		"RainbowDelimiterYellow",
		"RainbowDelimiterGreen",
		"RainbowDelimiterViolet",
		"RainbowDelimiterRed",
	},
})

return {}
