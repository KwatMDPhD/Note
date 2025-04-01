vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.signcolumn = "number"

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.autoread = true

vim.opt.updatetime = 800

vim.api.nvim_create_autocmd(
	{ "BufEnter", "CursorHold" },
	{
		pattern = "*",
		command = "checktime",
	}
)

vim.keymap.set("n", "<Leader>h", ":nohlsearch<CR>")

vim.keymap.set("n", "<C-0>", function()
	vim.g.neovide_scale_factor = 1
end)
vim.keymap.set("n", "<C-->", function()
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
end)
vim.keymap.set("n", "<C-=>", function()
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
end)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out =
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"--branch=stable",
			lazyrepo,
			lazypath,
		})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = { {
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd"colorscheme kanagawa"
		end,
	}, {
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	}, {
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				view = { width = 48 },
				filters = { dotfiles = true },
				sort = { sorter = "case_sensitive" },
			})
			vim.keymap.set("n", "<Leader>t", ":NvimTreeToggle<CR>")
		end,
	}, {
		"nvim-telescope/telescope.nvim",
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<Leader>f", builtin.find_files)
			vim.keymap.set("n", "<Leader>r", builtin.live_grep)
		end,
	}, {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "julia" },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	}, {
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	}, { "tpope/vim-fugitive" }, {
		"dominikduda/vim_current_word",
		config = function()
			vim.cmd"let g:vim_current_word#highlight_current_word = 0"
			vim.cmd"highlight CurrentWordTwins guibg=#790505"
		end,
	}, {
		"jpalardy/vim-slime",
		config = function()
			vim.g.slime_target = "screen"
			vim.g.slime_cell_delimiter = "# ---- #"
			vim.keymap.set("n", "<Space><Space>", "<Plug>SlimeSendCell")
			vim.keymap.set("x", "<Space><Space>", "<Plug>SlimeRegionSend")
		end,
	} },
})
