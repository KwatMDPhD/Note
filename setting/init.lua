vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.splitright = true
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

if vim.g.neovide then
	local sf = "neovide_scale_factor"
	vim.keymap.set("n", "<Leader>0", function()
		vim.g[sf] = vim.g[sf] - 0.1
	end)
	vim.keymap.set("n", "<Leader>1", function()
		vim.g[sf] = 1
	end)
	vim.keymap.set("n", "<Leader>2", function()
		vim.g[sf] = vim.g[sf] + 0.1
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
		view = { width = 64 },
		filters = {
			custom = { "^\\.git$" },
		},
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
		vim.cmd.colorscheme("tokyonight")
	end,
}, {
	"brenoprata10/nvim-highlight-colors",
	opts = {},
}, {
	"tzachar/local-highlight.nvim",
	opts = {
		animate = false,
		debounce_timeout = 8,
	},
}, "lewis6991/gitsigns.nvim", {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"lua",
			"html",
			"markdown",
			"markdown_inline",
			"julia",
		},
		highlight = { enable = true },
		indent = { enable = true },
	},
}, {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = "<Leader>a",
		persist_size = false,
		direction = "float",
		float_opts = {
			height = function()
				return math.floor(vim.o.lines * 0.88)
			end,
			width = function()
				return math.floor(vim.o.columns * 0.88)
			end,
			winblend = 24,
		},
	},
} })

vim.keymap.set("v", "<Space><Space>", function()
	require("toggleterm").send_lines_to_terminal("visual_selection", false, {
		args = vim.v.count,
	})
end)
