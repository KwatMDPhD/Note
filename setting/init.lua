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

vim.keymap.set("n", "<C-0>", function()
	vim.g.neovide_scale_factor = 1
end)
vim.keymap.set("n", "<C-->", function()
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
end)
vim.keymap.set("n", "<C-=>", function()
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
end)

vim.keymap.set("n", "<Leader>h", ":nohlsearch<CR>")

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
				update_focused_file = { enable = true },
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
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd("colorscheme kanagawa")
		end,
	}, {
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	}, {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "julia" },
		},
		config = function(_, opts)
			require("nvim-treesitter").setup(opts)
		end,
	}, {
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	}, {
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "julials" },
			})
		end,
	}, { "neovim/nvim-lspconfig" }, {
		"dominikduda/vim_current_word",
		config = function()
			vim.cmd("let g:vim_current_word#highlight_current_word = 0")
			vim.cmd("highlight CurrentWordTwins guibg=#790505")
		end,
	}, {
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	}, {
		"jpalardy/vim-slime",
		config = function()
			vim.g.slime_target = "screen"
			vim.g.slime_cell_delimiter = "# ---- #"
			vim.g.slime_bracketed_paste = 1
			vim.keymap.set("n", "<Space><Space>", "<Plug>SlimeSendCell")
			vim.keymap.set("x", "<Space><Space>", "<Plug>SlimeRegionSend")
		end,
	}, {
		"iamcco/markdown-preview.nvim",
		cmd = {
			"MarkdownPreviewToggle",
			"MarkdownPreview",
			"MarkdownPreviewStop",
		},
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	} },
})
