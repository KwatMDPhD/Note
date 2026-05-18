vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.signcolumn = "number"
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.updatetime = 240
vim.api.nvim_create_autocmd(
	{ "FocusGained", "BufEnter", "CursorHold" },
	{
		pattern = "*",
		command = "checktime",
	}
)
vim.keymap.set("n", "<Leader>h", "<Cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
if vim.g.neovide then
	vim.g.neovide_hide_mouse_when_typing = true
	vim.keymap.set("n", "<Leader>1", function()
		vim.g.neovide_scale_factor = 1
	end)
	vim.keymap.set("n", "<Leader>2", function()
		vim.g.neovide_scale_factor = (vim.g.neovide_scale_factor or 1) + 0.1
	end)
end
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({ {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		view = { width = 72 },
		filters = { dotfiles = true },
		sort = { sorter = "case_sensitive" },
		update_focused_file = { enable = true },
	},
	keys = { { "<Leader>t", "<Cmd>NvimTreeToggle<CR>" } },
}, {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{ "<Leader>b", "<Cmd>Telescope buffers<CR>" },
		{ "<Leader>f", "<Cmd>Telescope find_files<CR>" },
		{ "<Leader>r", "<Cmd>Telescope live_grep<CR>" },
	},
}, {
	"folke/tokyonight.nvim",
	config = function()
		vim.cmd.colorscheme("tokyonight-night")
	end,
}, {
	"brenoprata10/nvim-highlight-colors",
	opts = {},
}, {
	"RRethy/vim-illuminate",
	config = function()
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
		vim.api.nvim_set_hl(0, "CurSearch", { link = "IlluminatedWordText" })
	end,
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
	opts = {
		open_mapping = "<Leader>a",
		autochdir = true,
		direction = "vertical",
		size = 80,
	},
} })
vim.keymap.set("v", "<Space><Space>", function()
	require("toggleterm").send_lines_to_terminal("visual_selection", false, {
		args = vim.v.count,
	})
end)
