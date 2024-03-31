vim.opt.cmdheight = 2
vim.opt.guifont = "monospace:h17"
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.wrap = true

-- lvim.builtin.clipboard = {
-- 	copy = {
-- 		["+"] = "xclip -selection clipboard",
-- 	},
-- 	paste = {
-- 		["+"] = "xclip -selection clipboard -o",
-- 	},
-- }

lvim.builtin.clipboard = {
	copy = {
		["+"] = "xsel -i",
	},
	paste = {
		["+"] = "xsel -o",
	},
}

lvim.colorscheme = "fluoromachine"
lvim.transparent_window = true
-- lvim.format_on_save.enabled = true

lvim.keys.normal_mode["<leader>aw"] = ":wa<CR>"

-- use treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--
lvim.plugins = {
	{
		"pearofducks/ansible-vim",
		event = "BufRead",
	},
	{
		"maxmx03/fluoromachine.nvim",
		config = function()
			local fm = require("fluoromachine")
			local themeArray = { "fluoromachine", "retrowave", "delta" }
			local randomIndex = math.random(1, #themeArray)
			local randomTheme = themeArray[randomIndex]

			fm.setup({
				glow = true,
				theme = randomTheme,
				brightness = "0.9",
				overrides = {
					["@keyword"] = { italic = true },
					["@conditional"] = { italic = true },
					["@include"] = { italic = true },
					["@exception"] = { italic = true },
					["@define"] = { italic = true },
					-- ["@SpecialComment"] = { italic = true },
				},
			})
		end,
	},
	{ "zyedidia/vim-snake" },
	{ "sandheep45/synthwave84.nvim" },
	-- { "mg979/vim-visual-multi" },
	{
		"phaazon/hop.nvim",
		event = "BufRead",
		config = function()
			require("hop").setup()
			vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
			vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
		end,
	},
	{
		"ggandor/leap.nvim",
		name = "leap",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"nacro90/numb.nvim",
		event = "BufRead",
		config = function()
			require("numb").setup({
				show_numbers = true, -- Enable 'number' for the window while peeking
				show_cursorline = true, -- Enable 'cursorline' for the window while peeking
				hide_relativenumbers = true,
			})
		end,
	},
	{
		"f-person/git-blame.nvim",
		config = function()
			vim.cmd("highlight default link gitblame SpecialComment")
			require("gitblame").setup({ enabled = true })
		end,
	},
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
	{
		"romgrk/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				throttle = true, -- Throttles plugin updates (may improve performance)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
					-- For all filetypes
					-- Note that setting an entry here replaces all other patterns for this entry.
					-- By setting the 'default' entry below, you can control which nodes you want to
					-- appear in the context window.
					default = {
						"class",
						"function",
						"method",
					},
				},
			})
		end,
	},
	{
		"wakatime/vim-wakatime",
	},
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup({
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil, -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
			})
		end,
	},
	{
		"metakirby5/codi.vim",
		cmd = "Codi",
	},
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
		event = "BufRead",
	},
	{
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("spectre").setup()
		end,
	},
	{
		"wfxr/minimap.vim",
		build = "cargo install --locked code-minimap",
		-- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
		config = function()
			vim.cmd("let g:minimap_width = 10")
			vim.cmd("let g:minimap_auto_start = 1")
			vim.cmd("let g:minimap_auto_start_win_enter = 1")
		end,
	},
	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
		ft = { "fugitive" },
	},
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				filetypes = { "*" },
				user_default_options = {
					RGB = true, -- #RGB hex codes
					RRGGBB = true, -- #RRGGBB hex codes
					names = true, -- "Name" codes like Blue or blue
					RRGGBBAA = true, -- #RRGGBBAA hex codes
					AARRGGBB = true, -- 0xAARRGGBB hex codes
					rgb_fn = true, -- CSS rgb() and rgba() functions
					hsl_fn = true, -- CSS hsl() and hsla() functions
					css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = true, -- Enable all CSS functions: rgb_fn, hsl_fn
					-- Available modes for mode: foreground, background,virtualtext
					mode = "background", -- Set the display mode.
					-- Available methods are false / true / "normal" / "lsp" / "both"
					-- True is same as normal
					tailwind = true, -- Enable tailwind colors
					-- parsers can contain values used in |user_default_options|
					sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
					virtualtext = "■",
					-- update color values even if buffer is not focused
					-- example use: cmp_menu, cmp_docs
					always_update = true,
				},
				-- all the sub-options of filetypes apply to buftypes
				buftypes = {},
			})
		end,
	},
	{ "rust-lang/rust.vim" },
	{ "tpope/vim-eunuch" },
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		config = function()
			-- Change '<C-g>' here to any keycode you like.
			vim.keymap.set("i", "<C-g>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<c-;>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<c-,>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<c-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true, silent = true })
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		--   "BufReadPre path/to/my-vault/**.md",
		--   "BufNewFile path/to/my-vault/**.md",
		-- },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/Documents/Obsidian Vault/personal",
				},
				{
					name = "work",
					path = "~/Documents/Obsidian Vault/work",
				},
			},

			-- see below for full list of options 👇
		},
	},
}

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "eslint", filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" } },

	{ command = "rstcheck", filetypes = { "rust" } },
	-- { command = "sonarlint", filetypes = { "typescript", "typescriptreact", "python", "rust" } },

	-- linter for ansible
	{ command = "ansiblelint", filetypes = { "yaml", "yml" } },
})

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		command = "prettier",
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	},
	{
		command = "isort",
		filetypes = { "python" },
	},
	{
		command = "stylua",
		filetypes = { "lua" },
	},
	{
		command = "rustfmt",
		filetypes = { "rust" },
	},
})

-- add `csharp_ls` to `skipped_servers` list
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "csharp_ls" })
-- remove `omnisharp` from `skipped_servers` list
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
-- return server ~= "omnisharp"

-- remove `ansiblels` from `skipped_servers` list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "ansiblels"
end, lvim.lsp.automatic_configuration.skipped_servers)
