return {

	{
		"rebelot/heirline.nvim",
		optional = true,
		opts = function(_, opts)
			opts.statusline = nil
		end,
	},
	{
		"linrongbin16/lsp-progress.nvim",
		config = function()
			require("lsp-progress").setup()
		end,
	},
	{
		"freddiehaddad/feline.nvim",
		config = function()
			local present, feline = pcall(require, "feline")
			if not present then
				return
			end

			local separators = require("feline.defaults").statusline.separators.default_value
			local lsp = require("feline.providers.lsp")

			-- Customizations {{{
			local theme = {
				aqua = "#7AB0DF",
				bg = "#1C212A",
				blue = "#5FB0FC",
				cyan = "#70C0BA",
				darkred = "#FB7373",
				fg = "#C7C7CA",
				gray = "#222730",
				green = "#79DCAA",
				lime = "#54CED6",
				orange = "#FFD064",
				pink = "#D997C8",
				purple = "#C397D8",
				red = "#F87070",
				yellow = "#FFE59E",
			}

			local mode_theme = {
				["NORMAL"] = theme.green,
				["OP"] = theme.cyan,
				["INSERT"] = theme.aqua,
				["VISUAL"] = theme.yellow,
				["LINES"] = theme.darkred,
				["BLOCK"] = theme.orange,
				["REPLACE"] = theme.purple,
				["V-REPLACE"] = theme.pink,
				["ENTER"] = theme.pink,
				["MORE"] = theme.pink,
				["SELECT"] = theme.darkred,
				["SHELL"] = theme.cyan,
				["TERM"] = theme.lime,
				["NONE"] = theme.gray,
				["COMMAND"] = theme.blue,
			}

			local modes = setmetatable({
				["n"] = " NORMAL ",
				["no"] = " NORMAL ",
				["v"] = " VISUAL ",
				["V"] = "VISUAL LINE",
				[""] = "VB",
				["s"] = "S",
				["S"] = "SL",
				[""] = "SB",
				["i"] = " INSERT ",
				["ic"] = "I",
				["R"] = "R",
				["Rv"] = "VR",
				["c"] = "C",
				["cv"] = "EX",
				["ce"] = "X",
				["r"] = "P",
				["rm"] = "M",
				["r?"] = "C",
				["!"] = "SH",
				["t"] = "T",
			}, {
				__index = function()
					return "-"
				end,
			})
			-- }}}

			-- Components {{{
			local component = {}
			component.file_info = {
				provider = {
					name = "file_info",
				},
				hl = { bg = "#92B3F5", fg = "#000000", style = "italic" },
				left_sep = "",
				right_sep = "",
			}
			component.vim_mode = {
				provider = function()
					return modes[vim.api.nvim_get_mode().mode]
				end,
				hl = function()
					return {
						fg = "bg",
						bg = require("feline.providers.vi_mode").get_mode_color(),
						style = "bold",
						name = "NeovimModeHLColor",
					}
				end,
				left_sep = "",
				right_sep = " ",
			}

			component.git_branch = {
				provider = "git_branch",
				left_sep = "  ",
				right_sep = "",

				hl = {
					bg = "#54CED6",
					fg = "#000000",
					style = "bold",
				},

				-- Use custom padding amount
			}

			component.separator = {
				provider = " ",
				hl = {
					fg = "bg",
					bg = "bg",
				},
			}

			component.diagnostic_errors = {
				provider = "diagnostic_errors",
				hl = {
					fg = "red",
				},
			}

			component.diagnostic_warnings = {
				provider = "diagnostic_warnings",
				hl = {
					fg = "yellow",
				},
			}

			component.diagnostic_hints = {
				provider = "diagnostic_hints",
				hl = {
					fg = "aqua",
				},
			}

			component.diagnostic_info = {
				provider = "diagnostic_info",
			}

			component.lsp = {
				provider = function()
					if not lsp.is_lsp_attached() then
						return " 󱏎 LSP "
					end
					return string.format(" %s ", require("lsp-progress").progress())
				end,
				hl = function()
					if not lsp.is_lsp_attached() then
						return {
							bg = "#8FBCBB",
							fg = "#000000",
						}
					end
					return {
						bg = "#8FBCBB",
						fg = "#000000",
					}
				end,
				left_sep = {
					always_visible = true,
					str = separators.slant_right,
					hl = function()
						if not lsp.is_lsp_attached() then
							return {
								bg = "#8FBCBB",
								fg = "#000000",
							}
						end
						return {
							bg = "#8FBCBB",
							fg = "#000000",
						}
					end,
				},
				right_sep = {
					always_visible = true,
					str = separators.slant_right,
					hl = function()
						if not lsp.is_lsp_attached() then
							return { fg = "#8FBCBB", bg = "none" }
						end
						return { fg = "#8FBCBB", bg = "none" }
					end,
				},
			}

			component.lsps = {
				provider = {
					name = "lsp_client_names",
					opts = {
						filetype_icon = true,
					},
				},
				hl = {
					bg = "#8FBCBB",
					fg = "#000000",
					style = "italic",
				},
				left_sep = "",
				right_sep = "",
			}
			component.file_type = {
				provider = {
					name = "file_type",
					opts = {
						filetype_icon = true,
					},
				},
				hl = {
					bg = "#3B4252",
					fg = "#ECEFF4",
					style = "bold",
				},
				left_sep = "",
				right_sep = "",
			}

			component.scroll_bar = {
				provider = function()
					local chars = setmetatable({
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
						" ",
					}, {
						__index = function()
							return " "
						end,
					})
					local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
					local position = math.floor(line_ratio * 100)

					local icon = chars[math.floor(line_ratio * #chars)] .. position
					if position <= 5 then
						icon = " TOP"
					elseif position >= 95 then
						icon = " BOT"
					end
					return icon
				end,
				hl = function()
					local position =
						math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
					local fg
					local style

					if position <= 5 then
						fg = "aqua"
						style = "bold"
					elseif position >= 95 then
						fg = "red"
						style = "bold"
					else
						fg = "purple"
						style = nil
					end
					return {
						fg = fg,
						style = style,
						bg = "bg",
					}
				end,
				left_sep = "block",
				right_sep = "block",
			}
			local git = {
				branch = {
					provider = "git_branch",
					icon = " ",
					left_sep = " ",
					right_sep = "",

					hl = {
						bg = "#54CED6",
						fg = "#000000",
						style = "bold",
					},
				},
				add = {
					provider = "git_diff_added",
					left_sep = "",
					right_sep = "",

					hl = {
						fg = "#50C878",
						style = "bold",
					},
				},
				change = {
					provider = "git_diff_changed",
					icon = " ⟳ ",
					left_sep = "",
					right_sep = "",

					hl = {
						fg = "#FFC300",
						style = "bold",
					},
				},
				remove = {
					provider = "git_diff_removed",
					left_sep = "",
					right_sep = "",

					hl = {
						fg = "#FF5733",
						style = "bold",
					},
				},
			}
			-- }}}
			-- Arrangements -- {{{
			feline.setup({
				default_bg = "#000000",
				components = {
					active = {
						{
							component.separator,
							component.vim_mode,
							component.separator,
							git.branch,
							component.separator,
							git.change,
							git.add,
							git.remove,

							component.separator,
						}, -- left
						{ component.file_info }, -- middle
						{ -- right
							component.file_type,
							component.separator,

							component.lsps,
							component.separator,
							component.separator,
							component.diagnostic_errors,
							component.diagnostic_warnings,
							component.diagnostic_info,
							component.diagnostic_hints,
							component.scroll_bar,
						},
					},
				},
				theme = theme,
				vi_mode_colors = mode_theme,
			})
		end,
	},
}
