vim.opt.autoread = true

vim.api.nvim_create_autocmd(
	{ "BufEnter", "CursorHold" },
	{
		pattern = "*",
		command = "checktime",
	}
)

vim.opt.updatetime = 800

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.signcolumn = "number"

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

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
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				view = { width = 56 },
				filters = { dotfiles = true },
				sort = { sorter = "case_sensitive" },
			})
		end,
	}, {
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
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
		"jpalardy/vim-slime",
		config = function()
			vim.g.slime_target = "screen"
			vim.g.slime_cell_delimiter = "# ---- #"
		end,
	}, { "itchyny/vim-cursorword" }, { "rebelot/kanagawa.nvim" } },
})

vim.keymap.set("n", "<Leader>h", ":nohlsearch<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>t", ":NvimTreeToggle<CR>", { noremap = true })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader>f", builtin.find_files)
vim.keymap.set("n", "<Leader>r", builtin.live_grep)

vim.keymap.set("n", "<Space><Space>", "<Plug>SlimeSendCell", { noremap = true })
vim.keymap.set("x", "<Space><Space>", "<Plug>SlimeRegionSend", {
	noremap = true,
})

vim.cmd("colorscheme kanagawa")
