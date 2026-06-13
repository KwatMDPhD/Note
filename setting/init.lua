vim.g.loaded_netrw = true

vim.g.loaded_netrwPlugin = true

vim.opt.termguicolors = true

vim.opt.number = true

vim.opt.signcolumn = "number"

vim.opt.tabstop = 4

vim.opt.updatetime = 80

vim.opt.splitright = true

vim.opt.expandtab = true

vim.opt.shiftwidth = 4

vim.api.nvim_create_autocmd(
	{ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" },

	{
		pattern = "*",
		command = "checktime",
	}
)

vim.keymap.set("n", "<M-Down>", "<Cmd>resize -8<Enter>")

vim.keymap.set("n", "<M-Up>", "<Cmd>resize +8<Enter>")

vim.keymap.set("n", "<M-Left>", "<Cmd>vertical resize -8<Enter>")

vim.keymap.set("n", "<M-Right>", "<Cmd>vertical resize +8<Enter>")

vim.keymap.set("n", "<Leader>h", "<Cmd>nohlsearch<Enter>")

vim.keymap.set("t", "<Escape>", "<C-\\><C-n>")

vim.g.neovide_hide_mouse_when_typing = true

local function update(pr)
	vim.g.neovide_scale_factor = (vim.g.neovide_scale_factor or 1) + pr
end

vim.keymap.set("n", "<M-+>", function()
	update(0.2)
end)

vim.keymap.set("n", "<M-->", function()
	update(-0.2)
end)

local pa = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(pa) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim",
		pa,
	})
end

vim.opt.rtp:prepend(pa)

require("lazy").setup({ {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		view = { width = 80 },
		filters = { dotfiles = true },
		sort = { sorter = "case_sensitive" },
		update_focused_file = { enable = true },
	},
	keys = { { "<Leader>t", "<Cmd>NvimTreeToggle<Enter>" } },
}, {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{ "<Leader>b", "<Cmd>Telescope buffers<Enter>" },
		{ "<Leader>f", "<Cmd>Telescope find_files<Enter>" },
		{ "<Leader>r", "<Cmd>Telescope live_grep<Enter>" },
	},
}, "folke/tokyonight.nvim", {
	"RRethy/vim-illuminate",
	config = function()
		vim.api.nvim_create_autocmd("ColorScheme", { callback = function()
			vim.api.nvim_set_hl(0, "IlluminatedWordText", {
				bg = "#f3c13a",
				fg = "#000000",
			})
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", {
				link = "IlluminatedWordText",
			})
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", {
				link = "IlluminatedWordText",
			})
			vim.api.nvim_set_hl(0, "Search", {
				bg = "#ffb3a7",
				fg = "#000000",
			})
			vim.api.nvim_set_hl(0, "IncSearch", { link = "Search" })
			vim.api.nvim_set_hl(0, "CurSearch", {
				link = "IlluminatedWordText",
			})
		end })
		vim.cmd.colorscheme("tokyonight-night")
	end,
}, {
	"brenoprata10/nvim-highlight-colors",
	opts = {},
}, {
	"lewis6991/gitsigns.nvim",
	opts = {},
}, {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"zsh",
			"julia",
			"html",
			"markdown",
			"markdown_inline",
			"lua",
		},
		highlight = { enable = true },
		indent = { enable = true },
	},
}, {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = { open_mapping = "<Leader>a" },
} })
vim.keymap.set("v", "<Space><Space>", function()
	require("toggleterm").send_lines_to_terminal("visual_selection", false, {
		args = vim.v.count,
	})
end)
