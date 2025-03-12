vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.signcolumn = "number"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
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
    spec = {
        {
            "nvim-tree/nvim-tree.lua",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            lazy = false,
            config = function()
                require("nvim-tree").setup({
                    view = { width = 64 },
                    filters = { dotfiles = true },
                })
            end,
        },
        {
            "nvim-telescope/telescope.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                require("nvim-treesitter.configs").setup({
                    ensure_installed = { "julia" },
                    highlight = { enable = true },
                    indent = { enable = true },
                })
            end,
        },
        {
            "rebelot/kanagawa.nvim"
        },
	  {
	    "lewis6991/gitsigns.nvim",
	    config = function()
	      require("gitsigns").setup()
	    end,
	  },
        {
            "jpalardy/vim-slime",
            config = function()
                vim.g.slime_target = "screen"
                vim.g.slime_dont_ask_default = 1
                vim.g.slime_cell_delimiter = "# ---- #"
            end,
        },
    },
})

vim.keymap.set("n", "<Leader>h", ":nohlsearch<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>t", ":NvimTreeToggle<CR>", { noremap = true })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader>f", builtin.find_files)
vim.keymap.set("n", "<Leader>r", builtin.live_grep)

vim.keymap.set("n", "<Space><Space>", "<Plug>SlimeSendCell", { noremap = true })
vim.keymap.set("x", "<Space><Space>", "<Plug>SlimeRegionSend", { noremap = true })

vim.cmd("colorscheme kanagawa")
