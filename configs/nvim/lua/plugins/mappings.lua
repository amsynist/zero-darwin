return {
	{
		"AstroNvim/astrocore",
		---@type AstroCoreOpts
		opts = {
			mappings = {

				-- first key is the mode
				n = {
					["ln"] = {
						function()
							require("conform").format()
						end,
						desc = "Format Nix File",
					},
					["<leader>fp"] = {
						":Telescope zoxide list<cr>",
						desc = "Zoxide In Telescope",
					},
					["gp"] = {
						":Lspsaga peek_definition<cr>",
						desc = "peek definations",
					},
					["<leader>r"] = {
						":Lspsaga rename<cr>",
						desc = "Rename References",
					},

					["gr"] = {
						":Lspsaga finder<cr>",
						desc = "go to references",
					},
					["s"] = {
						":HopWord<cr>",
						desc = "Quick Search for Words",
					},
					["<leader>R"] = { ":AstroReload<cr>", desc = "Reloads config" },

					["M"] = {
						"<Esc>gg0ggV$G$",
						desc = "Select All",
					},
					["<leader>m"] = {
						function()
							require("harpoon.mark").add_file()
						end,
						desc = "Harpoon Mark",
					},

					["<leader><leader>"] = {
						"<Cmd>Telescope harpoon marks<CR>",
						desc = "Harpoon Man",
					},
					-- second key is the lefthand side of the map
					-- mappings seen under group name "Buffer"
					["<leader>zr"] = { "<Cmd>ExecutorRun<CR>", desc = "Run Executor" },
					["<leader>zs"] = { "<Cmd>ExecutorSetCommand<CR>", desc = "Set Executor Command" },
					["<leader>zh"] = { "<Cmd>ExecutorShowHistory<CR>", desc = "Set Executor History" },

					["<leader>zd"] = { "<Cmd>ExecutorToggleDetail<CR>", desc = "Toggle Executor Details" },
					["<leader>zb"] = { "<Cmd>CBccbox<CR>", desc = "Box Title" },
					["<leader>zt"] = { "<Cmd>CBllline<CR>", desc = "Tilted Line" },
					["<leader>zl"] = { "<Cmd>CBline<CR>", desc = "Simple Line" },
					["<leader>zm"] = { "<Cmd>CBllbox14<CR>", desc = "Marked" },

					["<End>"] = {
						"<cmd>ToggleTerm ToggleTerm size=20  direction=float name=zero<CR>",
						desc = "Toggle Terminal",
					},
					["<F2>"] = {
						"<Esc><C-\\><C-n>:ToggleTermToggleAll<CR>",
						desc = "Toggle Terminal",
					},

					["<C-l>"] = {
						function()
							require("runner").run()
						end,
						desc = "Run ",
					},

					["<A-r>"] = {
						"<cmd>SearchBoxReplace<CR>",
						desc = "Search and Replace",
					},
					-- mappings seen under group name "Buffer"
					["<leader>bD"] = {
						function()
							require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
								require("astronvim.utils.buffer").close(bufnr)
							end)
						end,
						desc = "Pick to close",
					},
					-- tables with the `name` key will be registered with which-key if it's installed
					-- this is useful for naming menus
					["<leader>b"] = { name = "Buffers" },
					["<Leader>td"] = { "<esc>:DBUIToggle<cr>", desc = "Toggle Database UI" },
					["<Leader>ts"] = {

						function()
							require("dbee").open()
						end,
						desc = "Toggle DatabaseV2 UI",
					},

					["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
					["<Leader>bD"] = {
						function()
							require("astroui.status").heirline.buffer_picker(function(bufnr)
								require("astrocore.buffer").close(bufnr)
							end)
						end,
						desc = "Pick to close",
					},
					-- tables with the `name` key will be registered with which-key if it's installed
					-- this is useful for naming menus
					["<Leader>b"] = { name = "Buffers" },
					-- quick save
					-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
				},
				i = {
					["<C-s>"] = { "<Esc>:w!<cr>", desc = "Save File" },
				},
				t = {
					-- setting a mapping to false will disable it
					-- ["<esc>"] = false,
				},
			},
		},
	},
	{
		"AstroNvim/astrolsp",
		---@type AstroLSPOpts
		opts = {
			mappings = {
				n = {
					-- this mapping will only be set in buffers with an LSP attached
					K = {
						function()
							vim.lsp.buf.hover()
						end,
						desc = "Hover symbol details",
					},
					-- condition for only server with declaration capabilities
					gD = {
						function()
							vim.lsp.buf.declaration()
						end,
						desc = "Declaration of current symbol",
						cond = "textDocument/declaration",
					},
				},
			},
		},
	},
}
