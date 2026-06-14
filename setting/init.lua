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
vim.keymap.set("n", "<D-Down>", "<Cmd>resize -8<Enter>")
vim.keymap.set("n", "<D-Up>", "<Cmd>resize +8<Enter>")
vim.keymap.set("n", "<D-Left>", "<Cmd>vertical resize -8<Enter>")
vim.keymap.set("n", "<D-Right>", "<Cmd>vertical resize +8<Enter>")
vim.keymap.set("n", "<Leader>h", "<Cmd>nohlsearch<Enter>")
vim.keymap.set("t", "<Escape>", "<C-\\><C-n>")
vim.g.neovide_hide_mouse_when_typing = true
vim.keymap.set("n", "<D-0>", function()
	vim.g.neovide_scale_factor = 1
end)
vim.keymap.set("n", "<D-->", function()
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.2
end)
vim.keymap.set("n", "<D-=>", function()
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.2
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
}, {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
}, {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("tokyonight-night")
	end,
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
	"brenoprata10/nvim-highlight-colors",
	opts = {},
}, {
	"lewis6991/gitsigns.nvim",
	opts = {},
}, {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "julia", "html", "markdown", "markdown_inline" },
		highlight = { enable = true },
		indent = { enable = true },
	},
}, {
	"akinsho/toggleterm.nvim",
	opts = { open_mapping = "<Leader>a" },
} })
vim.keymap.set("n", "<Leader>t", "<Cmd>NvimTreeToggle<Enter>")
vim.keymap.set("n", "<Leader>b", "<Cmd>Telescope buffers<Enter>")
vim.keymap.set("n", "<Leader>f", "<Cmd>Telescope find_files<Enter>")
vim.keymap.set("n", "<Leader>r", "<Cmd>Telescope live_grep<Enter>")
vim.keymap.set("v", "<Space><Space>", function()
	require("toggleterm").send_lines_to_terminal("visual_selection", false, {
		args = vim.v.count,
	})
end)
